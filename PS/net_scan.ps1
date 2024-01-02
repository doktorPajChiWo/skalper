$ping = New-Object System.Net.NetworkInformation.Ping
"192.168.55.1", "192.168.55.100" | ForEach-Object {$ping.Send($_)} | Select-Object Address, Status