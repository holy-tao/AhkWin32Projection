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

# Output needs to be one line for a problem matcher to pick it up
# https://github.com/actions/toolkit/issues/1540
function FlattenErrorBlocks {
    param([string]$text)

    if ([string]::IsNullOrWhiteSpace($text)) { return "" }

    $lines = $text -split "`r?`n"

    $blocks = @()
    $currentBlock = @()

    # Regex to detect the start of an error/warning block
    $blockStartRegex = ".*\.ahk \(\d+\) : ==> (Warning:|[^W].*)"

    foreach ($line in $lines) {
        if ($line -match $blockStartRegex) {
            if ($currentBlock.Count -gt 0) {
                # Join previous block into one line
                $blocks += ($currentBlock -join " ").Trim()
                $currentBlock = @()
            }
        }
        $currentBlock += $line.Trim()
    }

    # Add the last block
    if ($currentBlock.Count -gt 0) {
        $blocks += ($currentBlock -join " ").Trim()
    }

    return $blocks -join "`n"
}

# Print error context from a problem line. Does not print the actual problem line, the
# caller should still do that
function PrintErrorContext {
    param([string]$errorText)

    $blocks = @()  # Collect multiple blocks for thread safety
    $currentBlock = New-Object System.Text.StringBuilder

    foreach ($line in $errorText -split "`n") {
        $currentBlock.AppendLine($line) | Out-Null

        if ($line -match '^(?<file>.+\.ahk) \((?<lineno>\d+)\) : ==> (?<msg>.*)$') {
            $filePath = $matches['file']
            $lineNum = [int]$matches['lineno']

            if (Test-Path $filePath) {
                $fileLines = Get-Content -Path $filePath -ErrorAction SilentlyContinue
                $start = [Math]::Max(0, $lineNum - 3)
                $end = [Math]::Min($fileLines.Count - 1, $lineNum + 1)

                $currentBlock.AppendLine("-" * 80) | Out-Null
                for ($i = $start; $i -le $end; $i++) {
                    $prefix = if ($i -eq ($lineNum - 1)) { '>>' } else { '  ' }
                    $currentBlock.AppendLine(
                        ("{0,5} {1} {2}" -f ($i + 1), $prefix, $fileLines[$i])
                    ) | Out-Null
                }
                $currentBlock.AppendLine("-" * 80) | Out-Null
            }
        }

        # Flush finished block
        if ($line -match '^(?<file>.+\.ahk) \(\d+\) : ==>') {
            $blocks += $currentBlock.ToString()
            $currentBlock.Clear() | Out-Null
        }
    }

    # Flush any remaining text
    if ($currentBlock.Length -gt 0) {
        $blocks += $currentBlock.ToString()
    }

    # Write each block atomically to the host
    foreach ($b in $blocks) {
        Write-Host $b
    }
}

function Invoke-AhkValidation {
    param([string]$File, [string]$ExePath)

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

    $fails = 0

    if (-not [string]::IsNullOrWhiteSpace($stdout)) {
        $stdout = FlattenErrorBlocks $stdout
        PrintErrorContext $stdout

        $fails += 1
    }
    if (-not [string]::IsNullOrWhiteSpace($stderr)) {
        $stderr = FlattenErrorBlocks $stderr
        PrintErrorContext $stderr

        $fails += 1
    }

    return $fails
}