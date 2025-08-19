# Hardcoded AKS cluster info
$resourceGroup = "aks-learn-rg"
$clusterName = "aks-learn"

# Step 1: Get the node resource group
$nodeResourceGroup = az aks show `
    --resource-group $resourceGroup `
    --name $clusterName `
    --query "nodeResourceGroup" `
    --output tsv

if (-not $nodeResourceGroup) {
    Write-Host "ERROR: Could not find node resource group for cluster." -ForegroundColor Red
    exit 1
}

Write-Host "Node Resource Group: $nodeResourceGroup"

# Step 2: Get VM Scale Sets in the node resource group
$vmssList = az vmss list `
    --resource-group $nodeResourceGroup `
    --query "[].name" `
    --output tsv

if (-not $vmssList) {
    Write-Host "ERROR: No VM Scale Sets found in node resource group." -ForegroundColor Red
    exit 1
}

# Step 3: Start each VMSS
foreach ($vmss in $vmssList) {
    Write-Host "Starting VMSS: $vmss"
    az vmss start --resource-group $nodeResourceGroup --name $vmss
}
