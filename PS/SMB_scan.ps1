param($ip_network,$ip_range,$patterns,$extensions)
$ip_network = "1"
$ip_range = 100..102
$patterns = "pass","user","hasło","ssh-key","place","secret","wykaz","haslo","password","klucz"
$extensions ="xml","txt","conf","cfg","ps1","bat","doc"



$ping = New-Object System.Net.NetworkInformation.Ping
$results = $ip_range | ForEach-Object {$ping.Send("$ip_network$_", 100)} | Select-Object Address, Status
$live_hosts = $results | Where-Object {$_.Status -eq "Success"}

foreach ($target in $live_hosts){
    $dns_name = Resolve-DnsName $target.Address 2>$null
    Write-Host $dns_name.NameHost -ForegroundColor Red
    $nazwa = $dns_name.NameHost
    if ($dns_name.NameHost[0] -ne ""){ $nazwa = $dns_name.NameHost[0]}
    $wynik = (NET VIEW  $nazwa) 2>$null
    $linie = $wynik.count - 3 
    $wynik = $wynik[7..$linie] 2>$null
    $wynik = $wynik -replace " .*", ""
    $wynik = $wynik.split()
    #$wynik =  $wynik -replace 'Dysk'
    #$wynik =  $wynik.split()
    #$wynik = $wynik.trim().split() 2>$null
    
    
    foreach ($dysk in $wynik){
        Write-Host $dysk -ForegroundColor Blue
        $scie = "\\$nazwa\$dysk"
       foreach ($extension in $extensions){
        foreach ($pattern in $patterns){
            #(Get-ChildItem $scie -Recurse) 2>$null
            (Get-ChildItem $scie *.$extension -Recurse | Select-String -Pattern $pattern ) 2>$null
        }
       }        
    }
}



