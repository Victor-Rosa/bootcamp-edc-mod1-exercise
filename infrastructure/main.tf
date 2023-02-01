resource "aws_s3_bucket" "datalake" {
  #Parametros de configuração
  bucket = "${var.base_bucket_name}-${var.
  environment}-${var.number_user}"
  acl = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_terraform.py"
  acl    = "private"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")
}

provider "aws" {
  region = var.region
}
