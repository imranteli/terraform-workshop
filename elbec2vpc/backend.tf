terraform {
  backend "s3" {
    bucket = "terra-state-789"
    key = "terraform/backenddemo"
  }
}
