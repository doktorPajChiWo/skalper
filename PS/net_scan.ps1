param($ip_subnet, $ip_range)

$ping = New-Object System.Net.NetworkInformation.Ping
$ip_range | ForEach-Object {$ping.Send("$ip_subnet$_",1000)} | Select-Object Address, Status 