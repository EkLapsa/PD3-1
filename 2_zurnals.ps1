$datum = (Get-Date).AddDays(-7)

$eror = Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    Level = 2
    StartTime = $datum
}

if ($eror.Count -gt 10) {
    $tekst = "[KRITISKi] sistema ir nestabila!"
} else {
    $tekst = "[OK] Kludu limenis normals."
}

$erors1 = $eror | ForEach-Object {
    "$($_.TimeCreated) - $($_.Message)"
}

$tekst | Out-File "$env:USERPROFILE\Documents\Errors.txt"
$erors1 | Out-File "$env:USERPROFILE\Documents\Errors.txt" -Append



