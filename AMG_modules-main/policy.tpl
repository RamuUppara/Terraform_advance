
{
  "Version" : "2012-10-17",
  "Statement" : [
    {
      "Sid" : "VisualEditor0",
      "Action" : "sts:AssumeRole",
      "Effect"   : "Allow",
      "Resource" : [
        "arn:aws:iam::${account_id}:role/AMGCloudWatchDataSourceRole",
        "arn:aws:iam::${account_id}:role/AMGPrometheusDataSourceRole",
        "arn:aws:iam::${account_id}:role/AMGCloudWatchDataSourceRole",
        "arn:aws:iam::${account_id}:role/AMGPrometheusDataSourceRole",
        "arn:aws:iam::${account_id}:role/AMGCloudWatchDataSourceRole",
        "arn:aws:iam::${account_id}:role/AMGPrometheusDataSourceRole",
        "arn:aws:iam::${account_id}:role/AMGCloudWatchDataSourceRole"
      ]
    }
  ]
}
