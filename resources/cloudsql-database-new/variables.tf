variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "instance_name" {
  description = "GCP region"
  type        = string
}

variable "credentials" {
  description = "GCP credentials"
  type = string
}

variable "app_id" {
  type = string
}

variable "env_id" {
  type = string
}

variable "res_id" {
  type = string
}

variable "port" {
  type        = number
  description = "The port for the database (needs to match the database type)"
}
