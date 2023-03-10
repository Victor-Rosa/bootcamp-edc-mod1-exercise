resource "aws_s3_bucket" "datalake" {
  #Parametros de configuração
  bucket = "datalake-victorrosa-"
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