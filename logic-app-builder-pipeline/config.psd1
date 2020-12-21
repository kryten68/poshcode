@{
    #credentials
    azure_basics =@{
        resource_group = 'apps'
        tenant_id = '{{tenant-id}}'
        default_client_id = '{{client-application-id}}'
        default_client_secret = '{{client-secret}}'
    }

    #secrets
    secrets = @{
        keyvault_name = '{{key-vault-name}}'
        service_principal_id = '{{user-one}}'
        service_principal_secret = ''
    }

    #paths
    paths = @{
        source = ''
        sink = ''
    }

    #arm_variables
    arm_values = @{
        logic_app_name ='real_name'
        template_file_path = 'template.json'
    }

}