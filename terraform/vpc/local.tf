resource "random_integer" "subnet_public" {
  min = 10
  max = 255
}

resource "random_integer" "subnet_private" {
  min = 10
  max = 255
}

resource "random_integer" "subnet_database" {
  min = 10
  max = 255
}

locals {
  public_subnet_cidr  = "10.${random_integer.subnet_public.result}.0.0/24"
  private_subnet_cidr = "10.${random_integer.subnet_private.result}.0.0/24"
  database_subnet_cidr = "10.${random_integer.subnet_database.result}.0.0/24"
}
