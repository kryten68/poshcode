<#
    -- Poison Module For Powershell

#>

# Globals
$object_id = 1

# New-Poshobject
# Returns an empty PSCustomObject ready for use:
function new-poshobject() {
   $object = new-object -TypeName PSCustomObject
   add-member -InputObject $object -MemberType NoteProperty -Name "objectID" -Value $global:object_id
   $global:object_id++
   return $object
}


# Add-PoshObjectField
# Add field/value pairs to PSCustomObjects:
function add-elementtoposhobject {
    Param(
        [Parameter(
            Position=0, Mandatory=$true,
            HelpMessage="Variable containing the object into which this field should be added.")
        ][PSCustomObject] $object,

        [Parameter(
            Position=1, Mandatory=$true,
            HelpMessage="Name of the field to be added.")
        ][string] $fieldname,

        [Parameter(
            Position=2, Mandatory=$true,
            HelpMessage="Value for this field.")
        ]$value
    )

    add-member -InputObject $object -MemberType NoteProperty -Name $fieldname -Value $value
}


# Jsonify-PoshObject
# Converts poshobject to json string
function jsonify-poshobject {
    Param(
        [Parameter(position=0)]
        [PSCustomObject] $object
    )

    return ConvertTo-Json -InputObject $object
}
