resource "aws_ecs_service" "mongo" {
  name            = "mongodb"
  cluster         = "sourav"
 /* task_definition = "" */
  desired_count   = 3
  iam_role        = "sourav.raghuvanshi@nagarro.com"
  depends_on      = ["aws_iam_role_policy.foo"]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.foo.arn}"
    container_name   = "mongo"
    container_port   = 8080
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1]"
  }
}
