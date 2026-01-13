Write-Host "=== EasyDevOps installatie gestart ==="

# 1. Hier word de er gekeken of .NET SK 8 al is geinstalleerd, zo niet neemt dat hier plaats
if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    Write-Host "Installing .NET SDK 8..."
    winget install Microsoft.DotNet.SDK.8 --accept-package-agreements --accept-source-agreements
} else {
    Write-Host ".NET SDK is already installed."
}

# 2. Controleer en installeer Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Git..."
    winget install Git.Git --accept-package-agreements --accept-source-agreements
} else {
    Write-Host "Git is already installed."
}

# 3. Hier clonen we onze repo, als deze nog niet bestaat
$repoUrl = "https://github.com/Arnoldingo/ITM.git"
$repoFolder = "EasyDevOpsApp"

if (-not (Test-Path $repoFolder)) {
    Write-Host "Cloning repository..."
    git clone $repoUrl
} else {
    Write-Host "Repository already exists."
}

# 4. Hier start de app op
Write-Host "Starting EasyDevOps frontend..."
Set-Location "$repoFolder/frontend/EasyDevOpsApp"
dotnet run
