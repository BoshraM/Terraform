terraform {
  backend "s3" {
    key    = "terraform/tfstate.tfstate"
    bucket = "b-m-remote-backend"
    region = "eu-west-2"
  }
}
