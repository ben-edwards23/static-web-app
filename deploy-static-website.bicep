param parStorageAccountName string = 'staticweb${uniqueString(resourceGroup().id)}'
param parLocation string = resourceGroup().location
param parStorageAccountSKU string = 'Standard_LRS'
param parStorageAccountKind string = 'StorageV2'
param parStorageAccountContainerName string = 'static-website'

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: parStorageAccountName
  location: parLocation
  sku: {
    name: parStorageAccountSKU
  }
  kind: parStorageAccountKind
}

resource blobservice 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  name: 'default'
  parent: storageaccount
}

resource storageaccountcontainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  name: parStorageAccountContainerName
  parent: blobservice
}
