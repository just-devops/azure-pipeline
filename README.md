# Prerequisites

This is the list of prerequisites required to create a DevOps pipeline:

1. Create the backend for azure.  
    
    resource: https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage
    
    We do this using terraform. The tf code to provision the backend is in the `az-remote-backend-*` files.
    When you `terraform aply` for the first time the backend will be provisioned for you in azure.
    Also you will see the outputs, something like:
    ```
    Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
    
    Outputs:
    
    terraform_state_resource_group_name = "christos-tfstate-rg"
    terraform_state_storage_account = "christostfu4ld85vo"
    terraform_state_storage_container_core = "core-tfstate"
    ``` 
    
2. Creating a Service Principal and a Client Secret

    Using a Service Principal, also known as SPN, is a best practice for DevOps or CI/CD environments.
    First, we need to authenticate to Azure. To authenticate using Azure CLI, we type:
    ```
    az login
    ```
    The process will launch the browser and after the authentication is complete we are ready to go.
    We will use the following command to get the list of Azure subscriptions:
    ```
    az account list --output table
    ```
    We can select the subscription using the following command (both subscription id and subscription name are accepted):
    ```
    az account set --subscription <Azure-SubscriptionId>
    ```
    Then create the service principal account using the following command:
    ```
    az ad sp create-for-rbac --role="Contributor" 
    --scopes="/subscriptions/SUBSCRIPTION_ID"
    ```
    Executing the function above will return you the following values on a json
    These values will be mapped to these Terraform variables:
    ```
    appId (Azure) → client_id (Terraform).
    password (Azure) → client_secret (Terraform).
    tenant (Azure) → tenant_id (Terraform).
    ```
