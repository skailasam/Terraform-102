# aws region
variable "region" {
  description = "Region"
  type        = string
  default     = "ap-south-1"
}

#Environment
variable "environment" {
  type        = string
  default     = ""
}

# ami
variable "ami_id" {
  description = "AMI ID"
  default = "ami-0f1fb91a596abf28d"
}

# launch below instances
variable "instance_details" {
  description = "instance_details separate by :"
  default     = [
    {
      name        = "Web-101"
      sg_id       = ["sg-06953a59cdd6ecfd5"]
      subnet_id   = "subnet-0dabded7ce43cb46a"
      #private_ip  = "10.150.33.177"
      disk_size   = "8"
      disk_type   = "gp2"
      disk_tp     = true
      ami_id      = ""    ## ""|null take value from variable
      az          = "ap-south-1a"
      i_type      = "t2.micro"
      tags        = { "Name"="Web-101", "Cost Center"="UAT" }
      key_pair    = "a"
    },
    {
      name        = "Web-102"
      sg_id       = ["sg-06953a59cdd6ecfd5"]
      subnet_id   = "subnet-0b09dbf64cb2baf65"
      #private_ip  = "10.150.33.177"
      disk_size   = "8"
      disk_type   = "gp2"
      disk_tp     = true
      ami_id      = ""    ## ""|null take value from variable
      az          = "ap-south-1b"
      i_type      = "t2.micro"
      tags        = { "Name"="Web-102", "Cost Center"="UAT" }
      key_pair    = "a"
    }
  ]
}

## END

