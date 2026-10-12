# access-review.ps1
$Report = @()

# Find users with admin access
$Admins = Get-ADGroupMember -Identity "Admin-Access" -Recursive 
foreach ($Admin in $Admins) {
$User = Get-ADuser $Admin -Properties LastLogonDate, Department, Title
$Report += [PSCustomObject]@{
Username = $User.SamAccountName
Name = $User.Name
Department = $User.Department
Title = $User.Title
LastLogon = $User.LastLogonDate
AdminAccess = $true
}
}

# Find stale accounts (no login in 90 days)
$StaleDate = (Get-Date).AddDays(-90)
$Stale = Get-AdUser -Filter {LastLogonDate -lt $StaleDate -and Enabled -eq $true} `
-Properties LastLogonDate, Department
foreach ($User in $Stale) {
$Report += [PSCustomObject]@{
Username = $User.SamAccountName
Name = $User.Name
Department = $User.Department
Issue = "Stale: No login for 90+ days"
LastLogon = $User.LastLogonDate
}
}

# Export
$Report | Export-Csv -Path "access-review-report.csv" -NoTypeInformation
Write-Host "Report saved: access-review-report.csv" -ForegroundColor Cyan
Write-Host "Total findings: $($Report.Count)" -ForegroundColor Cyan