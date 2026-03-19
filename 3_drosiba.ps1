$status = Get-MpComputerStatus
if (-not $status.RealTimeProtectionEnabled -or $status.QuickScanAge -gt 3) {
    Write-Host "Sistema ir apdraudeta!"
} else {
    Write-Host "Sistema ir drosa."
}
