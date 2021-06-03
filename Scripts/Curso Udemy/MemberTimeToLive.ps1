Add-ADGroupMember -Identity "RRHH" -Members jgomez -MemberTimeToLive (New-TimeSpan -Days 2)

Get-ADGroup "RRHH" -Properties member -ShowMemberTimeToLive | ft member