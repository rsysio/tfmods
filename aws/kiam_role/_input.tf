variable "name" {
  type = string
}

variable "server_role_arn" {
  type = string
}

variable "role_policy" {
  type = string
}

variable "tags" {
  type = map(string)
}