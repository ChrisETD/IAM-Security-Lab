# offboard-user.ps1
param([string]$Username)

# Disable account
Disable-ADAccount -Identity $Username

# Remove from all groups except Domain Users
$Groups = Get-ADPrincipalGroupMembership $Username |
Where-Object { $_.Name -ne 'Domain Users' }
foreach ($Group in $Groups) {
Remove-ADGroupMember -Identity $Group -Members $Username -Confirm:$false
Write-Host "Removed From $($Group.Name)" -ForegroundColor Yellow
}

# Move to Disabled Users OU
$DisabledOU = "OU=Disabled Users,DC=iamlab,DC=local"
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Disabled Users'")) {
New-ADOrganizationalUnit -Name "Disabled Users" -Path "DC=iamlab,DC=local"
}
Move-ADObject -Identity (Get-ADuser $Username).DistinguishedName -TargetPath $DisabledOU

Write-Host "User $Username has been offboarded successfully" -ForegroundColor Red