resource "aws_autoscaling_group" "asg" {
  name                 = "${var.tag_name}_asg"
  min_size             = 0
  max_size             = "${var.number_instances}"
  desired_capacity     = "${var.number_instances}"
  launch_configuration = "aws_launch_configuration.asg_conf.name"
  tag {
    key                 = "Name"
    value               = "${var.tag_name}"
    propagate_at_launch = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "asg_conf" {
  name_prefix   = "${var.tag_name}-"
  image_id      = "${data.aws_ami.linux.id}"
  instance_type = "t2.micro"
  user_data     = "#!/bin/bash; set -xe; yum install -y docker; service docker start; chkconfig docker on; docker run hello-world"
  key_name      = "${var.aws_key_name}"
  lifecycle {
    create_before_destroy = true
  }
}
