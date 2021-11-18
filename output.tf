output "instance_ids" {
  description = "List of IDs of instances"
  value       = aws_instance.this.*.id
}

output "private_ips" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.this.*.private_ip
}

output "public_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.this.*.public_ip
}

output "elb_id" {
  description = "The name of the ELB"
  value       = concat(aws_elb.custom-elb.*.id, [""])[0]
}

output "elb_arn" {
  description = "The ARN of the ELB"
  value       = concat(aws_elb.custom-elb.*.arn, [""])[0]
}

output "elb_name" {
  description = "The name of the ELB"
  value       = concat(aws_elb.custom-elb.*.name, [""])[0]
}

output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = concat(aws_elb.custom-elb.*.dns_name, [""])[0]
}

output "elb_instances" {
  description = "The list of instances in the ELB"
  value       = flatten(aws_elb.custom-elb.*.instances)
}

