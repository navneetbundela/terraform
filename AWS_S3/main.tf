resource "aws_s3_bucket" "mybucket" {

    bucket = "my-bucket-${random_id.random_no.hex}"
  
}

resource "aws_s3_object" "bucket_data" {
  source = "./myfile.txt"
  key = "mydata.txt"
  bucket = aws_s3_bucket.mybucket.bucket
}