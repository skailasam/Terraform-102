provider "aws" {
  region = var.region
}

## Launch Instances via instance_details
resource "aws_instance" "this" {
  count                   = length(var.instance_details)
  availability_zone       = var.instance_details[count.index].az
  ami                     = coalesce(var.instance_details[count.index].ami_id, var.ami_id)
  instance_type           = var.instance_details[count.index].i_type
#  iam_instance_profile    = var.iam_instance_profile
  root_block_device {
    volume_size           = var.instance_details[count.index].disk_size
    volume_type           = var.instance_details[count.index].disk_type
    delete_on_termination = var.instance_details[count.index].disk_tp
  }
  subnet_id               = var.instance_details[count.index].subnet_id
  key_name                = var.instance_details[count.index].key_pair
  vpc_security_group_ids  = var.instance_details[count.index].sg_id
  tags                    = var.instance_details[count.index].tags
 # private_ip              = var.instance_details[count.index].private_ip
  volume_tags             = var.instance_details[count.index].tags
#  user_data                = file("user_data.sh")
  #user_data_base64        = base64encode(local.user_data)
}

#### Create a new load balancer
resource "aws_elb" "custom-elb" {
  name               = "custom-elb"
  availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
#  subnets            = ["subnet-0dabded7ce43cb46a", "subnet-0b09dbf64cb2baf65", "subnet-0661f2ae61f4dec59"]
  security_groups    = ["sg-06953a59cdd6ecfd5"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

#  instances                   = [aws_instance.foo.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "custom-elb"
  }
}

