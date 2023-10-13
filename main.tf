terraform {
    required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  # backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "WGS"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  # }
  
  cloud {
   organization = "WGS"
   workspaces {
     name = "terra-house-1"
   }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_baklava_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.baklava.public_path
  content_version = var.baklava.content_version
}

resource "terratowns_home" "home_baklava" {
  name = "Making Baklava at home"
  description = <<DESCRIPTION
Baklava is a layered pastry dessert made of filo pastry, 
filled with chopped nuts, and sweetened with syrup or honey. 
It was one of the most popular sweet pastries of Ottoman cuisine.
DESCRIPTION
  domain_name = module.home_baklava_hosting.domain_name
  town = "cooker-cove"
  content_version = var.baklava.content_version
}

module "home_daffodils_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.daffodils.public_path
  content_version = var.daffodils.content_version
}

resource "terratowns_home" "home_daffodils" {
  name = "My favourite flowers!"
  description = <<DESCRIPTION
Narcissus or Daffodils is a genus of predominantly spring flowering perennial plants of the 
amaryllis family, Amaryllidaceae. Various common names including daffodil, narcissus and jonquil, 
are used to describe all or some members of the genus
DESCRIPTION
  domain_name = module.home_daffodils_hosting.domain_name
  town = "video-valley"
  content_version = var.daffodils.content_version
}

module "home_kunafah_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.kunafah.public_path
  content_version = var.kunafah.content_version
}

resource "terratowns_home" "home_kunafah" {
  name = "How to make Kunafa/Knafeh!"
  description = <<DESCRIPTION
Kunafa or Knafeh is a traditional Middle Eastern dessert, 
made with spun pastry called kataifi,
soaked in a sweet, sugar-based syrup called attar, 
and typically layered with cheese, 
or with other ingredients such as clotted cream, 
pistachio or nuts, depending on the region.
DESCRIPTION
  domain_name = module.home_kunafah_hosting.domain_name
  town = "cooker-cove"
  content_version = var.kunafah.content_version
}