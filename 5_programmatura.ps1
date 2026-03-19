$upgrad = winget upgrade | Where-Object { $_ -match "^\S" } | Select-Object -Skip 2
$skait = $upgrad.Count
Write-Host "Sistama ir $skait programmas, kuras nepieciesams atjauninat."
