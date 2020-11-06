terraform {
  backend "gcs" {
    bucket  = "road-to-kubernetes"
    prefix  = "terraform/state"
  }
}
