
# company
variable "company" {
  type        = string
  description = "This variable defines the name of the company"
  default     = "ccc"
}

# environment
variable "environment" {
  type        = string
  default     = "demo"
  description = "This variable defines the environment to be built"
}

# azure region
variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "germanywestcentral"
}

variable "tier" {
  type        = string
  description = "Pricing tier"
  default     = "Standard"
}

variable "sku_size" {
  type        = string
  description = "The SKU size of a new app service plan. The options are: F1, D1, B1, B2, B3, S1, S2, S3, P1v2, P2v2, P3v2. Default: S1."
  default     = "S2"
}
