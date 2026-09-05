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

Import-Module -Name "$PSScriptRoot\Modules\Ahk-Validation.psm1"

Write-Output "Validating $($Files.Count) changed files..."

# Workers return diagnostic objects rather than printing. A problem in a file that others
# #include is reported once per includer, so the results are deduplicated here - on a single
# thread, which also keeps error blocks from interleaving.
$diagnostics = @($Files | ForEach-Object -Parallel {
    Import-Module -Name "$using:PSScriptRoot\Modules\Ahk-Validation.psm1"
    Invoke-AhkValidation -File $_ -ExePath $using:AhkExePath
} -ThrottleLimit 5 | Get-UniqueAhkDiagnostic)

$diagnostics | Format-AhkDiagnostic

$fileCount = @($diagnostics | Where-Object File | Select-Object -ExpandProperty File -Unique).Count
Write-Output "Done. $($diagnostics.Count) distinct problems in $fileCount files"

if ($diagnostics.Count -gt 0) {
    exit 1
}
exit 0
