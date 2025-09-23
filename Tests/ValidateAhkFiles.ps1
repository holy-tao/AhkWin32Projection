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

if (-not $Files -or $Files.Count -eq 0) {
    Write-Output "No .ahk files to validate."
    exit 0
}

Write-Output "Validating $($Files.Count) changed files..."
$fail = $false

foreach ($file in $Files) {
    if (-not (Test-Path $file)) { continue }

    Write-Host $file

    $lines = @(
        "#Warn VarUnset, StdOut"
        "#Warn Unreachable, StdOut"
        "#Include $file"
    )

    $psi = Get-AutoHotkeyProcStartInfo

    $proc = [System.Diagnostics.Process]::Start($psi)

    # Wrap the StandardInput BaseStream in a UTF8 StreamWriter without bom
    $sw = New-Object System.IO.StreamWriter(
        $proc.StandardInput.BaseStream,
        [System.Text.Encoding]::ASCII,
        4096,
        $false
    )
    $sw.NewLine = "`n"  # Probably not necessary but I'm being paranoid

    foreach ($line in $lines) {
        $sw.WriteLine($line)
    }
    $sw.Flush()
    $sw.Dispose()

    $stdout = $proc.StandardOutput.ReadToEnd()
    $stderr = $proc.StandardError.ReadToEnd()
    $proc.WaitForExit()

    if (-not [string]::IsNullOrWhiteSpace($stdout)) {
        Write-Output $stdout
        $fail = $true
    }
    if (-not [string]::IsNullOrWhiteSpace($stderr)) {
        $Host.UI.WriteErrorLine($stderr)
        $fail = $true
    }
}

if($fail){
    exit 1
}
else{
    exit 0
}