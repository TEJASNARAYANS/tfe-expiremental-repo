provider "azurerm" {
    version = 1.38
    }

# Create virtual network
resource "azurerm_virtual_network" "TFNet" {
    name                = "TestSubnetTFE"
    address_space       = ["192.168.0.0/16"]
    location            = "eastus"
    resource_group_name = "tfe-dev-d0-rg"

    tags = {
        environment = "Terraform Networking"
    }
}

# Create subnet
resource "azurerm_subnet" "tfsubnet" {
    name                 = "LabSubnet"
    resource_group_name = "tfe-dev-d0-rg"
    virtual_network_name = azurerm_virtual_network.TFNet.name
    address_prefix       = "192.168.1.0/24"
}
resource "azurerm_subnet" "tfsubnet2" {
    name                 = "LabSubnet2"
    resource_group_name = "tfe-dev-d0-rg"
    virtual_network_name = azurerm_virtual_network.TFNet.name
    address_prefix       = "192.168.2.0/24"
}
