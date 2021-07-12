provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}

resource "azurerm_dashboard" "dashboard" {
  name                = "throughput_lab"
  resource_group_name = var.rg
  location            = var.region
  dashboard_properties = templatefile("dash_template/dash.tpl",
    {
      sub_id         = data.azurerm_subscription.current.subscription_id,
      resource_group = var.rg,
      node           = var.node_name
  })
}
