$fail = "$env:USERPROFILE\Documents\Errors.txt"

$datum = Get-Date -Format "yyyy-MM-dd"

$arhivs = "$env:USERPROFILE\Documents\Atskaite_$datum.zip"

Compress-Archive -Path $fail -DestinationPath $arhivs -Force

$lielums = (Get-Item $arhivs).Length / 1KB
Write-Host "Arhiva izmers: $([math]::Round($lielums,2)) KB"

