resource "aws_autoscaling_policy" "asg1-cpu-scale-up-policy" {
  name                   = "asg1-cpu-scale-up-policy"
  autoscaling_group_name = module.asg1.this_autoscaling_group_name
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  scaling_adjustment     = 1
}

resource "aws_cloudwatch_metric_alarm" "asg1-cpu-scale-up-alarm" {
  alarm_name          = "asg1-cpu-alarm-scale-up"
  alarm_description   = "asg1-cpu-alarm-scale-up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "70"
  dimensions = {
    "AutoScalingGroupName" = module.asg1.this_autoscaling_group_name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.asg1-cpu-scale-up-policy.arn]
}

resource "aws_autoscaling_policy" "asg1-cpu-scale-down-policy" {
  name                   = "asg1-cpu-scale-down-policy"
  autoscaling_group_name = module.asg1.this_autoscaling_group_name
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  scaling_adjustment     = -1
}

resource "aws_cloudwatch_metric_alarm" "asg1-cpu-scale-down-alarm" {
  alarm_name          = "asg1-cpu-alarm-scale-down"
  alarm_description   = "asg1-cpu-alarm-scale-down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "20"
  dimensions = {
    "AutoScalingGroupName" = module.asg1.this_autoscaling_group_name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.asg1-cpu-scale-down-policy.arn]
}

resource "aws_autoscaling_policy" "asg2-cpu-scale-up-policy" {
  name                   = "asg2-cpu-scale-up-policy"
  autoscaling_group_name = module.asg2.this_autoscaling_group_name
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  scaling_adjustment     = 1
}

resource "aws_cloudwatch_metric_alarm" "asg2-cpu-scale-up-alarm" {
  alarm_name          = "asg2-cpu-alarm-scale-up"
  alarm_description   = "asg2-cpu-alarm-scale-up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "70"
  dimensions = {
    "AutoScalingGroupName" = module.asg2.this_autoscaling_group_name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.asg2-cpu-scale-up-policy.arn]
}

resource "aws_autoscaling_policy" "asg2-cpu-scale-down-policy" {
  name                   = "asg2-cpu-scale-down-policy"
  autoscaling_group_name = module.asg2.this_autoscaling_group_name
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  scaling_adjustment     = -1
}

resource "aws_cloudwatch_metric_alarm" "asg2-cpu-scale-down-alarm" {
  alarm_name          = "asg2-cpu-alarm-scale-down"
  alarm_description   = "asg2-cpu-alarm-scale-down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "20"
  dimensions = {
    "AutoScalingGroupName" = module.asg2.this_autoscaling_group_name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.asg2-cpu-scale-down-policy.arn]
}