Clear-Host
$dir = $PSScriptRoot
$config = Import-PowerShellDataFile -Path "$($dir)\data.psd1"
$config.tenant_id
$config.password.two
