resource "aws_instance" "myec2" {
   ami = "ami-05d72852800cbf29e"
   instance_type = var.instance_type
}
