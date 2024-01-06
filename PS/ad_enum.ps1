Write-Host "Checking info about domain" -ForegroundColor DarkMagenta
Get-ADDomain
Get-ADDefaultDomainPasswordPolicy

Write-Host "Checking info about Computers" -ForegroundColor DarkMagenta
Get-ADComputer -Filter * | Select-Object Name, Enabled | Export-CSV -Path ./computer.Exporrt.CSV
Write-Host "Checking info about Users and Groups" -ForegroundColor DarkMagenta
Get-ADUser -Filter * | Select-Object Name, SAMAccountName, Enabled | Export-CSV -Path ./users.Exporrt.CSV
Get-ADGroup -Filter * | Where-object {$_.SamAccountName -like '*admin*'} |Format-Table
Write-Host "Checking info about DC and Forest" -ForegroundColor DarkMagenta
Get-ADDomainController
Get-ADForest
Write-Host "ADSI Part" -ForegroundColor Cyan

([adsisearcher]"(name=*Nowak*)").FindAll()
([adsisearcher]"(&(objectcategory=Computer)(name=*msti*))").FindAll()
([adsisearcher]"(info=*)").FindAll() | %{$_.GetDirectoryEntry()} | Select-object Name, Info |Format-list


