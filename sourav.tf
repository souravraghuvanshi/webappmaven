
resource "aws_cloudwatch_log_group" "souravraghuvanshi/sourav-jenkins-webapp:ver1" {
  name              = "souravraghuvanshi/sourav-jenkins-webapp:ver1"
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "souravraghuvanshi/sourav-jenkins-webapp:ver1" {
  family = "souravraghuvanshi/sourav-jenkins-webapp:ver1"

  container_definitions = <<EOF
[
  {
    "name": "souravraghuvanshi/sourav-jenkins-webapp:ver1",
    "image": "souravraghuvanshi/sourav-jenkins-webapp:ver1",
    "cpu": 0,
    "memory": 32,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "us-east-1",
        "awslogs-group": "souravraghuvanshi/sourav-jenkins-webapp:ver1",
        "awslogs-stream-prefix": "complete-ecs"
      }
    }
  }
]
EOF
}

resource "aws_ecs_service" "souravraghuvanshi/sourav-jenkins-webapp:ver1" {
  name            = "souravraghuvanshi/sourav-jenkins-webapp:ver1d"
  cluster         = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.souravraghuvanshi/sourav-jenkins-webapp:ver1.arn}"

  desired_count = 1

  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 0
}
 
