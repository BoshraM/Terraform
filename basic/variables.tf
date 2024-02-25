variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "ec2name" {
  type    = string
  default = "myec2"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["value1", "value2"]
}

variable "mymap" {
  type = map(any)
  default = {
    key1 = "value1"
    key1 = "value2"
  }
}

# variable "inputname" {
#   type        = string
#   description = "set the name of the vpc"
# }

variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "myvpc"
    port = [22, 25, 80]
  }
}
