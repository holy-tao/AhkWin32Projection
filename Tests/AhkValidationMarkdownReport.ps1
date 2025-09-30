param(
    [string]$LogPath = "validation.log",
    [string]$OutPath = "validation-summary.md"
)

$regexError   = "^(.*\.ahk) \((\d+)\) : ==> (?!Warning:)(.*)$"
$regexWarning = "^(.*\.ahk) \((\d+)\) : ==> Warning: (.*)$"

$errors = @()
$warnings = @()

foreach ($line in Get-Content $LogPath) {
    if ($line -match $regexError) {
        $errors += @{
            file  = $matches[1]
            line  = $matches[2]
            msg   = $matches[3].Trim()
        }
    } elseif ($line -match $regexWarning) {
        $warnings += @{
            file  = $matches[1]
            line  = $matches[2]
            msg   = $matches[3].Trim()
        }
    }
}

$report = @()
$report += "# AutoHotkey Validation Report"
$report += ""
$report += "**Errors:** $($errors.Count)"
$report += "**Warnings:** $($warnings.Count)"
$report += ""

if ($errors.Count -gt 0) {
    $report += "## Errors"
    foreach ($e in $errors) {
        $report += "- `${$($e.file)}:${($e.line)} — $($e.msg)"
    }
    $report += ""
}

if ($warnings.Count -gt 0) {
    $report += "## Warnings"
    foreach ($w in $warnings) {
        $report += "- `${$($w.file)}:${($w.line)} — $($w.msg)"
    }
}

# Write GitHub summary (for Checks tab)
$summary = @()
$summary += "## AutoHotkey Validation Summary"
$summary += ""
$summary += "- **‼️Errors:** $($errors.Count)"
$summary += "- **⚠️Warnings:** $($warnings.Count)"
$summary += ""
$summary += "Full details are available in the job log and artifact download."

$summaryFile = $env:GITHUB_STEP_SUMMARY
$summary -join "`n" | Out-File -FilePath $summaryFile -Encoding utf8 -Append

# Also write detailed report for artifact
$reportFile = "validation-summary.md"
$report -join "`n" | Out-File -FilePath $reportFile -Encoding utf8