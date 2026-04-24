# restart-hummod.ps1
$humModPath = "C:\GitHub\HumMod-UTSC-CPG\HumMod.EXE"
$humModDir = Split-Path -Parent $humModPath

# Kill existing HumMod instance (if running)
Get-Process "HumMod" -ErrorAction SilentlyContinue | Stop-Process

# Small delay to ensure it shuts down
Start-Sleep -Milliseconds 500

# Start HumMod again from its directory
Push-Location $humModDir
try {
    Start-Process -FilePath ".\HumMod.EXE" -WorkingDirectory $humModDir -Wait:$false
} finally {
    Pop-Location
}
