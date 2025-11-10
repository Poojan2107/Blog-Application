Param(
    [string]$RemoteUrl = "https://github.com/Poojan2107/Blog-App.git",
    [string]$Branch = "master",
    [string]$TempDir = "$env:TEMP\blog_app_clean_push"
)

Write-Host "Preparing clean push to $RemoteUrl (branch: $Branch)"

$Workspace = (Resolve-Path -Path .).Path
Write-Host "Workspace: $Workspace"

if (Test-Path $TempDir) {
    Write-Host "Removing existing temp dir: $TempDir"
    Remove-Item -LiteralPath $TempDir -Recurse -Force -ErrorAction SilentlyContinue
}

New-Item -ItemType Directory -Path $TempDir | Out-Null

# Directories and files to exclude
$excludeDirs = @('.git', 'node_modules', '.vscode', 'coverage', 'build', 'dist')
$excludeFiles = @('.env', '.env.*', '*.log', 'npm-debug.log*')

# Use robocopy to copy workspace to temp dir while excluding unwanted files/dirs
# robocopy <Source> <Dest> <FilePattern> [options]
$xd = $excludeDirs -join ' '
$xf = $excludeFiles -join ' '

Write-Host "Copying files to temporary directory (excluding: $($excludeDirs -join ', '), $($excludeFiles -join ', '))"

# Robocopy returns non-zero codes for some successful cases, so suppress errors
$robocopyCmd = "robocopy `"$Workspace`" `"$TempDir`" * /E /COPY:DAT /R:2 /W:1"
foreach ($d in $excludeDirs) { $robocopyCmd += " /XD `"$d`"" }
foreach ($f in $excludeFiles) { $robocopyCmd += " /XF `"$f`"" }

Write-Host $robocopyCmd
cmd.exe /c $robocopyCmd | Out-Null

# Ensure .git isn't copied
$targetGit = Join-Path $TempDir '.git'
if (Test-Path $targetGit) { Remove-Item -LiteralPath $targetGit -Recurse -Force }

# Initialize fresh git repo and push
Push-Location $TempDir
if (-not (Test-Path ".git")) {
    git init | Out-Null
}

git add .
try {
    git commit -m "Clean import of project" | Out-Null
} catch {
    Write-Host "Nothing to commit or commit failed. Continuing."
}

# Set branch name
try {
    git branch -M $Branch
} catch {
    # ignore
}

# Add remote and push
Write-Host "Adding remote and pushing (this will require your git credentials)."
if ((git remote) -notcontains 'origin') {
    git remote add origin $RemoteUrl
} else {
    git remote set-url origin $RemoteUrl
}

Write-Host "About to push to $RemoteUrl (branch: $Branch) with --force. This will overwrite the remote branch if it exists."

git push -u origin $Branch --force

if ($LASTEXITCODE -eq 0) {
    Write-Host "Push completed successfully."
} else {
    Write-Host "Push failed with exit code $LASTEXITCODE. Ensure your git credentials are configured and you have permission to push to the repository."
}

Pop-Location
Write-Host "Temporary directory retained at: $TempDir (you can remove it manually)"
