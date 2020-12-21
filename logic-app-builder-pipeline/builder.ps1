Clear-Host

# .1    Import the config and required dependencies
$config = Import-PowerShellDataFile -path "$(get-location)/config.psd1"
import-module -name "$(get-location)/utils.psm1" -force

# .2    Create a credential object from the config file values
$default_client_username = $config.azure_basics.default_client_id
$default_client_secret = $config.azure_basics.default_client_secret
$default_credential = new-azcredentialobject -username $default_client_username -password $default_client_secret

# .3    Connect to Az as the default client
Connect-AzAccount -credential $default_credential `
    -Tenant $config.azure_basics.tenant_id `
    -ServicePrincipal `
    -warningAction SilentlyContinue

Write-Output "Connected to Az......"

# .4 Attempt to test the logic app deployment
$template_test_status = Test-AzResourceGroupDeployment  `
    -ResourceGroupName $config.azure_basics.resource_group `
    -TemplateFile "$(get-location)/template.json" `
    -Verbose

if ( $template_test_status -ne $null) {
    Write-Output "We got an error"
    exit
} else { Write-Output "test passed...." }

$arm_template = get-content -Path "$(get-location)/$($config.arm_values.template_file_path)"
$arm_template = $arm_template -replace "{{logic-app-name}}", "kst-logic-app"
$arm_template = $arm_template | convertfrom-json -AsHashtable


New-AzResourceGroupDeployment `
    -ResourceGroupName $config.azure_basics.resource_group `
    -TemplateObject $arm_template `
    -mode 'incremental'

Disconnect-AzAccount
