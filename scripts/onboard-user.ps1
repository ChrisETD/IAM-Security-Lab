# onboard-user.ps1
param(
[String]$FirstName,
[String]$LastName,
[String]$Department,
[String]$Title
)

$Username = ($FirstName[0] + $LastName).ToLower()
$UPN = "$Username@iamlab.local"
$OU = "OU=$Department,DC=iamlab,DC=local"
$Password = ConvertTo-SecureString "Welcome1!" -AsPlainText -Force

# Create User
New-ADUser -Name "$FirstName $LastName" `
-SamAccountName $Username -UserPrincipalName $UPN `
-GivenName $FirstName -Surname $LastName `
-Title $Title -Department $Department `
-Path $OU -AccountPassword $Password `
-Enabled $true -ChangePasswordAtLogon $True

# Add to department group
Add-ADGroupMember -Identity "$Department-Staff" -Members $Username

Write-Host "Created User: $Username in $Department" -ForegroundColor Green
Write-Host "Added to group: $Department-Staff" -ForegroundColor Green