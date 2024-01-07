$username = 'admin'
$password = 'Password123'

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-object System.Management.Automation.PScredential $username, SecurePassword
STart-process powershell.exe -Credential $credential