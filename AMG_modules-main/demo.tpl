{
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "VisualEditor0",
        Action = "sts:AssumeRole",
        Effect   = "Allow",
        Resource = [
          "arn:aws:iam::${account}:role/AMGCloudWatchDataSourceRole",
          "arn:aws:iam::${account}:role/AMGPrometheusDataSourceRole",
          "arn:aws:iam::${account}:role/AMGCloudWatchDataSourceRole",
          "arn:aws:iam::${account}:role/AMGPrometheusDataSourceRole",
          "arn:aws:iam::${account}:role/AMGCloudWatchDataSourceRole",
          "arn:aws:iam::${account}:role/AMGPrometheusDataSourceRole",
          "arn:aws:iam::${account}:role/AMGCloudWatchDataSourceRole"
        ]
      },
    ]
  }