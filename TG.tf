###
resource "aws_lb_target_group" "custom-tg" {
  name     = "custom-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
####
resource "aws_lb_target_group_attachment" "custom-t" {
  target_group_arn = aws_lb_target_group.custom-tg.arn
  target_id        = "${element(aws_instance.this.output.instance_ids, count.index)}"
  port             = 80
}

