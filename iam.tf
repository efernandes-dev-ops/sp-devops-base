resource "aws_iam_instance_profile" "sp_app_instance_profile" {
  name = "sp-app-instance-profile-${var.environment}"
  role = aws_iam_role.sp_app_iam_role.name
}

resource "aws_iam_role" "sp_app_iam_role" {
  name = "sp_app_iam_role-${var.environment}"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "sp_iam_ec2_policy" {
  name        = "sp-iam-ec2-policy-${var.environment}"
  description = "IAM policy for sp integration app ec2 instance"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "sp_ec2_iam_policy_attach" {
  role       = aws_iam_role.sp_app_iam_role.name
  policy_arn = aws_iam_policy.sp_iam_ec2_policy.arn
}
