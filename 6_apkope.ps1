$disk = Get-PSDrive C
$briv = ($disk.Free / ($disk.Used + $disk.Free)) * 100
$datum = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

if ($freePercent -lt 25) {

    $viet = $disk.Free

    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue

    $disk = Get-PSDrive C
    $vietp = $disk.Free

    $atbriviet = ($vietp - $viet) / 1GB

    $tekst = "$datum Tirisana veikta. Atbrivoti $([math]::Round($atbriviet,2)) GB."

} else {
    $tekst = "$datum Vieta pietiekama."
}
$tekst | Out-File "$env:USERPROFILE\Documents\Apkope.log" -Append
