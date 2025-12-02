# restart-hummod.ps1
$humModPath = "C:\Users\Shafin\HumMod-UTSC-CPG\HumMod.EXE"

# Kill existing HumMod instance (if running)
Get-Process "HumMod" -ErrorAction SilentlyContinue | Stop-Process

# Small delay to ensure it shuts down
Start-Sleep -Milliseconds 500

# Start HumMod again
Start-Process $humModPath
