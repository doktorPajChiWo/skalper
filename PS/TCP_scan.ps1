param($ip_network,$ip_range,$port_range)
$tcp_client = New-Object System.Net.Sockets.TcpClient
$tcp_client.SendTimeout = 50 

$port_range = 1..200
$ip_network = "137.41.170."
$ip_range = 18..30

ForEach ( $host_ip IN $ip_range )  {
    $current_ip = "$ip_network$host_ip"
    echo  "Skanuje: $current_ip"
    $port_range | ForEach-Object { echo ($tcp_client.Connect($current_ip, $_)) "Host $current_ip Port $_ is open" } 2> $null
}

