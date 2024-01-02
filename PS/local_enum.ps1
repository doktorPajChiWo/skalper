write-host "---------------LOCAL ENUM-------------------"
Write-Host "--------Testing: $ENV:COMPUTERNAME----------"
write-host "--------------------------------------------"

Get-ComputerInfo CsDNSHostName, CsDomain, OsName, OsVersion, OsBuildNumber, OsHostFixes, OSHardwareAbstractionLayer, WindowsVersion, BIOSSMBiosBiosVersion 

Write-Host "----------------Installed software-----------"

Get-WmiObject win32_product | Select-Object Name,Version,PackaggeName, InstallDate | Format-Table

Write-Host "----------------Installed AV-----------------"

Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntiVirusProduct
Get-MpComputerStatus

Get-NetAdapter | Format-Table
Get-NetIPAddress | Format-Table

net user
net localgroup

Write-Host "-----------------------------------------------"