# This is a version of the ValidateAhk.ps1 script found in the generator meant for use
# In CI/CD pipelines. As such, it takes a list of filepaths instead of searching for
# files to validate itself.
#
# USAGE (run at repo root):
#   $changed = git fetch origin main --depth=1
#   $changed = git diff --name-only origin/main...HEAD | Where-Object { $_ -like "*.ahk" }
#
#   ./Tests/ValidateAhkFiles.ps1 -AhkExePath "path/to/AutoHotkey64.exe" -Files $changed

param(
    [Parameter(Mandatory=$true)]
    [string]$AhkExePath,

    [string[]]$Files
)

function Get-AutoHotkeyProcStartInfo {
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = $AhkExePath
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

if (-not $Files -or $Files.Count -eq 0) {
    Write-Output "No .ahk files to validate."
    exit 0
}

Write-Output "Validating $($Files.Count) changed files..."
$fail = $false

foreach ($file in $Files) {
    if (-not (Test-Path $file)) { continue }

    $lines = @(
        "#Warn VarUnset, StdOut"
        "#Warn Unreachable, StdOut"
        "#Include $file"
    )

    $psi = Get-AutoHotkeyProcStartInfo

    $proc = [System.Diagnostics.Process]::Start($psi)

    # Wrap the StandardInput BaseStream in an ASCII StreamWriter to
    # suppress the BOM - weird things are happening on the GitHub 
    # runners
    $sw = New-Object System.IO.StreamWriter(
        $proc.StandardInput.BaseStream,
        [System.Text.Encoding]::ASCII,
        4096,
        $false
    )
    $sw.NewLine = "`n"  # Probably not necessary but I'm being paranoid

    # Send lines as lines
    foreach ($line in $lines) {
        $sw.WriteLine($line)
    }
    $sw.Flush()
    $sw.Dispose()   # Let the StreamWriter deal with the underlying input stream

    $stdout = $proc.StandardOutput.ReadToEnd()
    $stderr = $proc.StandardError.ReadToEnd()
    $proc.WaitForExit()

    if (-not [string]::IsNullOrWhiteSpace($stdout)) {
        $stdout = FlattenErrorBlocks $stdout
        Write-Output $stdout
        $fail = $true
    }
    if (-not [string]::IsNullOrWhiteSpace($stderr)) {
        $stderr = FlattenErrorBlocks $stderr
        Write-Output $stderr
        $fail = $true
    }
}

if($fail){
    exit 1
}
else{
    exit 0
}