# create a pscredential object from username and password strings
function new-azcredentialobject {
    param(
        [parameter(mandatory)]
        [string] $username,

        [parameter(mandatory)]
        [string] $password
    )

    [securestring] $secure_password = ConvertTo-SecureString `
        -String $default_client_secret `
        -AsPlainText -Force

    [pscredential] $credential = new-object System.Management.Automation.PSCredential($default_client_username, $secure_password)

    return $credential
}


Export-ModuleMember -Function new-azcredentialobject