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

if (-not $Files -or $Files.Count -eq 0) {
    Write-Output "No .ahk files to validate."
    exit 0
}

Write-Output "Validating $($Files.Count) changed files..."

# Thread-safe hashtable

$failures = $Files | ForEach-Object -Parallel {
    Import-Module -name "$using:PSScriptRoot\Modules\Ahk-Validation.psm1"
    $failuresForFile = Invoke-AhkValidation -File $_ -ExePath $using:AhkExePath

    # Return so the ForEach-Object can collect failures
    return $failuresForFile
} -ThrottleLimit 5 | Measure-Object -Sum | Select-Object -ExpandProperty Sum

Write-Output "Done. $failures files had errors or warnings"
exit $failures> 0
