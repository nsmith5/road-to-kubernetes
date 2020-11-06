provider "google" {
  project = "cloudrun-284100"
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
}

resource "google_container_registry" "registry" {
  project  = "cloudrun-284100"
  location = "US"
}

resource "google_cloud_run_service" "my-service" {
  name     = "road-to-kubernetes"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us.gcr.io/cloudrun-284100/road-to-kubernetes:${var.image_tag}"
        env {
          name = "BIND_PORT"
          value = "8080"
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.run]
}

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.my-service.name
  location = google_cloud_run_service.my-service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
