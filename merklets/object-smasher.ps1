clear-host


$address = @("Line 1", "Line 2")

$object_stage_one = New-Object -TypeName pscustomobject

Add-Member -InputObject $object_stage_one -MemberType NoteProperty -Name "Name" -Value "Stuart Henderson"
Add-Member -InputObject $object_stage_one -MemberType NoteProperty -Name "Age" -Value 21
Add-Member -InputObject $object_stage_one -MemberType NoteProperty -Name "Address" -value $address

$address += "West Lothian"

#$json_stage_one = ConvertTo-Json -InputObject $object_stage_one -Depth 10
#$json_stage_one

Add-Member -InputObject $object_stage_one -MemberType NoteProperty -Name "Address" -value $address -Force
#$json_stage_one = ConvertTo-Json -InputObject $object_stage_one -Depth 10
#$json_stage_one

Add-Member -InputObject $object_stage_one -MemberType NoteProperty -Name "IQ" -value 200
$object_stage_one | Format-List
$object_stage_one | ConvertTo-Json

$skills = New-Object -TypeName pscustomobject
Add-Member -InputObject $skills -MemberType NoteProperty -name "Skill #1" -Value "Powershell!"

Add-Member -InputObject $object_stage_one -MemberType NoteProperty -Name "Skills" -Value $skills
$object_stage_one | ConvertTo-Json
