function Get-AutoHotkeyProcStartInfo {
    param([string]$ExePath)

    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = $ExePath
    $psi.Arguments = "/ErrorStdOut /Validate *"
    $psi.RedirectStandardInput = $true
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.UseShellExecute = $false
    return $psi
}

# Matches the first line of an AutoHotkey diagnostic block, e.g.
#   C:\path\Foo.ahk (12) : ==> Warning: This variable appears to never be assigned a value.
$script:AhkDiagnosticHeader = '^(?<file>.+\.ahk) \((?<lineno>\d+)\) : ==> (?<msg>.*)$'

# Paths are compared case-insensitively and resolved where possible, since AutoHotkey may
# report an included file by a different (but equivalent) path than the one we walked.
function Resolve-AhkPath {
    param([string]$Path)

    $resolved = Resolve-Path -LiteralPath $Path -ErrorAction SilentlyContinue
    if ($resolved) { return $resolved.Path }
    return $Path
}

# Parses raw AutoHotkey output into one object per diagnostic. Continuation lines (the
# "Specifically:" line and friends) are attached to the diagnostic they belong to.
#
# Any text that doesn't parse is still emitted, as a diagnostic with no File/Line, so that
# unexpected output is never silently swallowed by the dedup pass.
function ConvertTo-AhkDiagnostic {
    param(
        [string]$Text,

        # Severity for blocks that don't announce themselves as warnings. AutoHotkey writes
        # errors to stderr and #Warn output to stdout, so the caller supplies the default.
        [ValidateSet('Error', 'Warning')]
        [string]$DefaultSeverity = 'Error',

        # File the validator was invoked on, recorded on each diagnostic
        [string]$SourceFile
    )

    if ([string]::IsNullOrWhiteSpace($Text)) { return }

    $current = $null
    $preamble = @()

    function New-Diagnostic($state) {
        [PSCustomObject]@{
            File       = $state.File
            Line       = $state.Line
            Severity   = $state.Severity
            Message    = $state.Message
            Detail     = @($state.Detail)
            SourceFile = $state.SourceFile
        }
    }

    foreach ($line in ($Text -split "`r?`n")) {
        if ($line -match $script:AhkDiagnosticHeader) {
            if ($current) { New-Diagnostic $current }

            $message = $matches['msg'].Trim()
            $current = @{
                File       = Resolve-AhkPath $matches['file']
                Line       = [int]$matches['lineno']
                Severity   = if ($message -like 'Warning:*') { 'Warning' } else { $DefaultSeverity }
                Message    = $message
                Detail     = @($preamble)
                SourceFile = $SourceFile
            }
            $preamble = @()
        }
        elseif (-not [string]::IsNullOrWhiteSpace($line)) {
            if ($current) { $current.Detail += $line.Trim() }
            else { $preamble += $line.Trim() }
        }
    }

    if ($current) { New-Diagnostic $current }

    # Output that never produced a header line - keep it rather than dropping it
    if ($preamble.Count -gt 0) {
        [PSCustomObject]@{
            File       = $null
            Line       = 0
            Severity   = $DefaultSeverity
            Message    = ($preamble -join ' ').Trim()
            Detail     = @()
            SourceFile = $SourceFile
        }
    }
}

# Stable key for deduplication. The same underlying problem is reported once per file that
# transitively #includes the offending file, and every one of those reports is identical
# apart from which file we happened to be validating - which is exactly what's excluded here.
function Get-AhkDiagnosticKey {
    param([PSCustomObject]$Diagnostic)

    $parts = @(
        $Diagnostic.File
        $Diagnostic.Line
        $Diagnostic.Severity
        $Diagnostic.Message
        ($Diagnostic.Detail -join '~')
    )
    return ($parts -join '|').ToLowerInvariant()
}

# Collapses duplicate diagnostics and orders them by file, then line
function Get-UniqueAhkDiagnostic {
    param([Parameter(ValueFromPipeline = $true)][PSCustomObject]$Diagnostic)

    begin {
        $seen = [System.Collections.Generic.HashSet[string]]::new()
        $unique = [System.Collections.Generic.List[PSCustomObject]]::new()
    }
    process {
        if ($null -eq $Diagnostic) { return }
        if ($seen.Add((Get-AhkDiagnosticKey $Diagnostic))) { $unique.Add($Diagnostic) }
    }
    end {
        $unique | Sort-Object File, Line, Message
    }
}

$script:SourceLineCache = @{}

# Renders a diagnostic as a single line (so a problem matcher can pick it up - see
# https://github.com/actions/toolkit/issues/1540) followed by its surrounding source lines.
#
# Writes to the success stream, not the host, so that CI can Tee-Object the output into a log
# for AhkValidationMarkdownReport.ps1 to parse.
function Format-AhkDiagnostic {
    param(
        [Parameter(ValueFromPipeline = $true)][PSCustomObject]$Diagnostic,

        # Source lines to show either side of the offending line. 0 disables the context block.
        [int]$ContextLines = 2
    )

    process {
        $header = if ($Diagnostic.File) {
            "$($Diagnostic.File) ($($Diagnostic.Line)) : ==> $($Diagnostic.Message)"
        } else {
            $Diagnostic.Message
        }

        Write-Output ((@($header) + $Diagnostic.Detail) -join ' ').Trim()

        if ($ContextLines -le 0 -or -not $Diagnostic.File) { return }

        if (-not $script:SourceLineCache.ContainsKey($Diagnostic.File)) {
            $script:SourceLineCache[$Diagnostic.File] =
                @(Get-Content -LiteralPath $Diagnostic.File -ErrorAction SilentlyContinue)
        }
        $fileLines = $script:SourceLineCache[$Diagnostic.File]
        if ($fileLines.Count -eq 0) { return }

        $start = [Math]::Max(0, $Diagnostic.Line - 1 - $ContextLines)
        $end = [Math]::Min($fileLines.Count - 1, $Diagnostic.Line - 1 + $ContextLines)

        $block = New-Object System.Text.StringBuilder
        $block.AppendLine("-" * 80) | Out-Null
        for ($i = $start; $i -le $end; $i++) {
            $prefix = if ($i -eq ($Diagnostic.Line - 1)) { '>>' } else { '  ' }
            $block.AppendLine(("{0,5} {1} {2}" -f ($i + 1), $prefix, $fileLines[$i])) | Out-Null
        }
        $block.Append("-" * 80) | Out-Null

        Write-Output $block.ToString()
    }
}

# Runs AutoHotkey's validator over a single file and returns its diagnostics as objects.
# Nothing is printed here: callers collect the results, deduplicate them, and format them
# on a single thread, which keeps blocks from interleaving when run in parallel.
function Invoke-AhkValidation {
    param(
        [string]$File,
        [string]$ExePath,

        # Drop diagnostics that belong to #included files rather than to $File itself. Only
        # safe when every file is validated in its own right, i.e. when walking a whole tree.
        [switch]$OwnFileOnly
    )

    if (-not (Test-Path $File)) { return }

    $lines = @(
        "#Warn VarUnset, StdOut"
        "#Warn Unreachable, StdOut"
        "#Include $File"
    )

    $psi = Get-AutoHotkeyProcStartInfo -ExePath $ExePath

    $proc = [System.Diagnostics.Process]::Start($psi)

    $sw = New-Object System.IO.StreamWriter(
        $proc.StandardInput.BaseStream,
        [System.Text.Encoding]::ASCII,
        4096,
        $false
    )
    $sw.NewLine = "`n"
    foreach ($line in $lines) { $sw.WriteLine($line) }
    $sw.Flush()
    $sw.Dispose()

    $stdout = $proc.StandardOutput.ReadToEnd()
    $stderr = $proc.StandardError.ReadToEnd()
    $proc.WaitForExit()

    $resolvedFile = Resolve-AhkPath $File

    $diagnostics = @(
        ConvertTo-AhkDiagnostic -Text $stdout -DefaultSeverity Warning -SourceFile $resolvedFile
        ConvertTo-AhkDiagnostic -Text $stderr -DefaultSeverity Error -SourceFile $resolvedFile
    )

    if ($OwnFileOnly) {
        $diagnostics = @($diagnostics | Where-Object { $_.File -eq $resolvedFile })
    }

    return $diagnostics
}
