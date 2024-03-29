terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}