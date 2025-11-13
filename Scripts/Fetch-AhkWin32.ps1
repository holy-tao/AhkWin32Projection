<#
Fetch-AhkWin32.ps1

Purpose
  Given one or more fully-qualified type names from the repo, download
  those .ahk files **and** all of their transitive #Include dependencies
  into a local folder. Then generate a single entry-point .ahk file that
  #Includes just the explicitly requested type files; the type files
  themselves keep their #Include lines to pull in the dependencies.

Usage
  # Minimal: fetch a single type into .\lib
  .\Fetch-AhkWin32.ps1 -Types "Windows.Win32.Networking.WinHttp.IWinHttpRequest"

  # Multiple types
  .\Fetch-AhkWin32.ps1 -Types "Windows.Win32.UI.Shell.SHELLFLAGSTATE","Windows.Win32.UI.WindowsAndMessaging.HWND"

  # Fetch a specific version
  .\Fetch-AhkWin32.ps1 -Types "Windows.Win32.Networking.WinHttp.IWinHttpRequest" -tag "v3.0.0-alpha"

  # From a file (one type per line)
  .\Fetch-AhkWin32.ps1 -TypesFile .\types.txt

  # Custom output directory and branch
  .\Fetch-AhkWin32.ps1 -TypesFile .\types.txt -OutDir .\vendor -Branch main

Output
  - <OutDir>\Windows\...  (mirrors the repo subfolders for the fetched files)
  - <OutDir>\Win32.includes.ahk  (your entry-point includes)
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false, Position = 0)]
    [string[]] $Types,

    [Parameter(Mandatory = $false)]
    [string] $TypesFile,

    [Parameter(Mandatory = $false)]
    [string] $OutDir = "./lib",

    [Parameter(Mandatory = $false)]
    [string] $Owner = "holy-tao",

    [Parameter(Mandatory = $false)]
    [string] $Repo = "AhkWin32Projection",

    [Parameter(Mandatory = $false)]
    [string] $Branch = "",

    [Parameter(Mandatory = $false)]
    [string] $Tag = "latest",

    [Parameter(Mandatory = $false)]
    [switch] $Force
)

$ErrorActionPreference = "Stop"

#region Helpers

function Join-Url {
    param(
        [Parameter(Mandatory = $true)][string] $Base,
        [Parameter(Mandatory = $true)][string] $Path
    )

    $baseUri = [Uri]::new($Base.TrimEnd('/') + '/')
    $rel = $Path -replace '\\', '/'
    return ([Uri]::new($baseUri, $rel)).AbsoluteUri

}

function Format-RepoPath {
    param(
        [Parameter(Mandatory = $true)][string]$Path
    )

    ($Path -replace '\\', '/') -replace '^/+', ''
}

function Resolve-RelativePathInRepo {
    param(
        [Parameter(Mandatory = $true)][string] $BaseRepoPath,
        [Parameter(Mandatory = $true)][string] $IncludeRaw
    )

    $inc = $IncludeRaw.Trim()
    if ($inc -match '^<.*>$') { return $null }
    $inc = $inc -replace '^[\"\'']', '' -replace '[\"\'']$', ''

    # Normalize separators
    $inc = $inc -replace '\\', '/'
    $baseDir = [IO.Path]::GetDirectoryName(($BaseRepoPath -replace '/', '\\')) -replace '\\', '/'

    # Split and resolve
    $baseSegs = @()
    if ($baseDir) { 
        $baseSegs = $baseDir.Split('/', [System.StringSplitOptions]::RemoveEmptyEntries) 
    }
    $incSegs = $inc.Split('/', [System.StringSplitOptions]::RemoveEmptyEntries)

    $stack = New-Object System.Collections.Generic.List[string]
    foreach ($seg in $baseSegs) { 
        [void]$stack.Add([string]$seg) 
    }

    $overTop = 0
    foreach ($seg in $incSegs) {
        if ($seg -eq '.') { continue }
        elseif ($seg -eq '..') {
            if ($stack.Count -gt 0) { 
                [void]$stack.RemoveAt($stack.Count - 1) 
            }
            else { $overTop++ }
        }
        else {
            [void]$stack.Add($seg)
        }
    }

    # Allow escaping up to repo root; clamp if beyond
    if ($overTop -ge 1) {
        $resolved = ($incSegs | Where-Object { $_ -ne '..' -and $_ -ne '.' }) -join '/'
    }
    else {
        $resolved = ($stack -join '/')
    }

    $resolved = Format-RepoPath $resolved
    Write-Debug "Resolved $IncludeRaw to $resolved"
    return $resolved
}

function Get-IncludesFromContent {
    param(
        [Parameter(Mandatory = $true)][string]$AhkContent
    )

    $regex = '(?m)^[ \t]*#Include(?:\s+\*i)?\s+(.+?)\s*$'
    $includes = [regex]::Matches($AhkContent, $regex)
    return $includes | ForEach-Object { $_.Groups[1].Value.Trim() }
}

function Convert-TypeNameToRepoPath {
    param(
        [Parameter(Mandatory = $true)][string] $TypeName
    )

    if (-not $TypeName.StartsWith('Windows.')) {
        throw "Type '$TypeName' must start with 'Windows.'"
    }

    $relative = ($TypeName -replace '\.', '/') + '.ahk'
    return Format-RepoPath $relative
}

function Add-Directory {
    param(
        [string]$Path
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        [void](New-Item -ItemType Directory -Path $Path -Force)
    }
}

function Get-TextWithRetry {
    param(
        [Parameter(Mandatory = $true)][string]$Uri,
        [int]$MaxAttempts = 4,
        [int]$DelayMs = 600
    )

    $attempt = 0
    do {
        try {
            $attempt++
            return (Invoke-WebRequest -Uri $Uri -UseBasicParsing -ErrorAction Stop).Content
        }
        catch {
            Write-Debug "Request to $Uri failed (attempt $attempt). Retrying in $$DelayMs * $attempt()ms"
            if ($attempt -ge $MaxAttempts) { 
                throw "Request to $Uri failed after $attempt attempts"
            }
            Start-Sleep -Milliseconds ($DelayMs * $attempt)
        }
    } while ($true)
}

function Get-BaseUrl {
    $rawBase = "https://raw.githubusercontent.com/$Owner/$Repo"

    if(-not [string]::IsNullOrWhiteSpace($Tag)){
        if($Tag.ToLower() -eq "latest"){
            $Tag = Get-LatestReleaseTag
        }

        return "$rawBase/refs/tags/$Tag/"
    }
    elseif (-not [string]::IsNullOrWhiteSpace($Branch)){
        return "$rawBase/$Branch/"
    }

    throw "A branch or tag name is required"
}

function Get-LatestReleaseTag {
    $release = Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/latest"
    Write-Host "Using latest release: $($release.tag_name)"
    return $release.tag_name
}

#endregion Helpers

#region Inputs

$resolvedTypes = @()

if ($TypesFile) {
    if (-not (Test-Path -LiteralPath $TypesFile)) {
        throw "Types file not found: $TypesFile"
    }

    $fileTypes = Get-Content -LiteralPath $TypesFile | Where-Object { $_ -and $_.Trim() -ne '' } | ForEach-Object { $_.Trim() }
    $resolvedTypes += $fileTypes
}

if ($Types) { 
    $resolvedTypes += $Types 
}

$resolvedTypes = $resolvedTypes | Select-Object -Unique
if (-not $resolvedTypes) {
    throw "Provide -Types and/or -TypesFile with at least one fully-qualified type."
}

Write-Host "Fetching $($resolvedTypes.Length) type(s) with dependencies:"
$resolvedTypes | ForEach-Object { Write-Host "`t$_" }

$rawBase = Get-BaseUrl
Write-Verbose "Fetching from $rawBase"
$targetRoot = (Resolve-Path -LiteralPath $OutDir -ErrorAction SilentlyContinue)

if (-not $targetRoot) {
    Add-Directory $OutDir
    $targetRoot = Resolve-Path -LiteralPath $OutDir
}
$targetRoot = $targetRoot.Path

#endregion Inputs

#region Fetch graph

$visited = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$queue = New-Object System.Collections.Generic.Queue[string]

$explicitRepoPaths = @()
foreach ($t in $resolvedTypes) {
    $p = Convert-TypeNameToRepoPath $t
    $explicitRepoPaths += $p
    $queue.Enqueue($p)
}

$allFetched = @()

while ($queue.Count -gt 0) {
    $repoPath = $queue.Dequeue()
    if ($visited.Contains($repoPath)) { continue }
    $visited.Add($repoPath) | Out-Null

    $rawUrl = Join-Url -Base $rawBase -Path $repoPath
    try {
        $content = Get-TextWithRetry -Uri $rawUrl
        Write-Verbose "Downloaded $repoPath ($rawUrl)"
    }
    catch {
        Write-Warning "Failed to download $repoPath ($rawUrl). $_"
        continue
    }

    $localPath = Join-Path $targetRoot ($repoPath -replace '/', '\\')
    Add-Directory (Split-Path -Parent $localPath)

    if ($Force -or -not (Test-Path -LiteralPath $localPath)) {
        Set-Content -LiteralPath $localPath -Value $content -NoNewline -Encoding UTF8
    }

    $allFetched += $repoPath

    $includes = Get-IncludesFromContent -AhkContent $content

    foreach ($inc in $includes) {
        $resolved = Resolve-RelativePathInRepo -BaseRepoPath $repoPath -IncludeRaw $inc
        if (-not $resolved) { continue }
        if (-not $resolved.EndsWith('.ahk', [StringComparison]::OrdinalIgnoreCase)) { continue }
        if (-not $visited.Contains($resolved)) {
            Write-Verbose "Enqueing dependency: $resolved"
            $queue.Enqueue($resolved) 
        }
    }
}

$allFetched = $allFetched | Sort-Object -Unique

#endregion

#region Emit entry-point includes 

$entryPoint = Join-Path $targetRoot 'Win32.includes.ahk'
$banner = @(
    "; Auto-generated by Fetch-AhkWin32.ps1 on $(Get-Date -Format o)",
    "; Repo: $Owner/$Repo@$([string]::IsNullOrWhiteSpace($Branch)? $Tag : $Branch)",
    "; Output root: $targetRoot"
)

$includeLines = foreach ($p in $explicitRepoPaths) {
    $rel = ($p -replace '/', '\')
    "#Include `"$rel`""
}

Set-Content -LiteralPath $entryPoint -Value ($banner + "" + $includeLines) -Encoding UTF8

Write-Host "Fetched $($allFetched.Count) files into '$targetRoot'" -ForegroundColor Green
Write-Host "Entry point: $entryPoint" -ForegroundColor Green

#endregion Emit entry-point includes
