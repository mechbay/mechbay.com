@description('Name of the Static Web App. (stapp)')
@minLength(2)
@maxLength(60)
param name string

@description('Azure region of the deployment')
param location string = resourceGroup().location

@allowed([ 'Free', 'Standard' ])
param sku string = 'Free'

@description('Tags to add to the resources')
param tags object = {}

resource name_resource 'Microsoft.Web/staticSites@2022-09-01' = {
  name: name
  location: location
  tags: tags
  sku: {
    tier: sku
    name: sku
  }
}
