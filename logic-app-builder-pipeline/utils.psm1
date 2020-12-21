# create a pscredential object from username and password strings
function new-azcredentialobject {
    param(
        [parameter(mandatory)]
        [string] $username,

        [parameter(mandatory)]
        [string] $password
    )

    [securestring] $secure_password = $password | ConvertTo-SecureString

    [pscredential] $credential = new-object System.Management.Automation.PSCredential($default_client_username, $secure_password)

    return $credential
}


Export-ModuleMember -Function new-azcredentialobject