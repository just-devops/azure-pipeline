
# azure region
variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "north europe"
}


variable "tier" {
  type        = string
  description = "SKU is short for 'Stock-keeping-Unit'. It basically stands for an item which is on sale, in lamen language."
  default     = "Standard"
}



variable "sku_size" {
  type        = string
  description = "The SKU size of a new app service plan. The options are: F1, D1, B1, B2, B3, S1, S2, S3, P1v2, P2v2, P3v2. Default: S1."
  default     = "S1"
}

