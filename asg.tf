data "template_file" "user_data" {
  template                    = "${file("user_data.tpl")}"
}
resource "aws_autoscaling_group" "asg" {
  name                        = "${var.tag_name}_asg"
  min_size                    = 0
  max_size                    = "${var.number_instances}"
  desired_capacity            = "${var.number_instances}"
  launch_configuration        = "${aws_launch_configuration.asg_conf.id}"
  vpc_zone_identifier         = ["${aws_subnet.public.id}"]
  tag {
    key                       = "Name"
    value                     = "${var.tag_name}"
    propagate_at_launch       = true
  }

  lifecycle = {
    create_before_destroy     = true
  }
}

resource "aws_launch_configuration" "asg_conf" {
  name_prefix                 = "${var.tag_name}-"
  image_id                    = "${data.aws_ami.linux.id}"
  key_name                    = "${var.aws_key_name}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  security_groups             = ["${aws_security_group.web.id}"]
  enable_monitoring           = false

  user_data                   = "${data.template_file.user_data.rendered}"
  lifecycle {
    create_before_destroy     = true
  }
}
