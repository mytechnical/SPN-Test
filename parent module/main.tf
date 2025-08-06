module "azurerm_resource_group" {
  source                  = "../child module/azurerm_resource_group"
  resource_group_name     = "RG-Test01"
  resource_group_location = "west europe"
}

module "azurerm_virtual_network" {
  depends_on           = [module.azurerm_resource_group]
  source               = "../child module/azurerm_virtual_network"
  virtual_network_name = "vnet-test01"
  location             = "west europe"
  resource_group_name  = "RG-Test01"
  address_space        = ["10.0.0.0/16"]
}
