@{
    #credentials
    azure_basics =@{
        resource_group = 'apps'
        tenant_id = 'cf933758-c824-45d3-a465-d31e6f5b002c'
        default_client_id = 'e395717f-230e-445e-be68-0a7e04e424fb'
        default_client_secret = 'cred.txt'
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