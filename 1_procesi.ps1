$skait = 0
$g = get-process | Group-Object -Property ProcessName | Where-Object { $_.Name -ne 'svchost' } |
 % {
     [PSCustomObject]@{
         ProcessName = $_.Name
         Mem_MB = [math]::Round(($_.Group|Measure-Object WorkingSet64 -Sum).Sum / 1MB, 0)
     }
 } | sort -desc Mem_MB | Select-Object -First 5 

foreach ($s in $g.Mem_MB)
{    $skait += $s
 }
Write-Host "Top 5 procesu total RAM:" $skait "MB" 


