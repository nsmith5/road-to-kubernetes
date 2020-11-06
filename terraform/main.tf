provider "google" {
  project = "cloudrun-284100"
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
}

resource "google_project_service" "redis" {
  service = "redis.googleapis.com"
}

resource "google_project_service" "vpcaccess" {
  service = "vpcaccess.googleapis.com"
}

resource "google_container_registry" "registry" {
  project  = "cloudrun-284100"
  location = "US"
}

resource "google_redis_instance" "cache" {
  name           = "cache"
  memory_size_gb = 1
  region         = "us-central1"

  depends_on = [google_project_service.redis]
}

resource "google_vpc_access_connector" "connector" {
    name          = "vpcconn"
    region        = "us-central1"
    ip_cidr_range = "10.8.0.0/28"
    network       = "default"

    depends_on = [google_project_service.vpcaccess]
}

resource "google_cloud_run_service" "my-service" {
  name     = "road-to-kubernetes"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us.gcr.io/cloudrun-284100/road-to-kubernetes:${var.image_tag}"
        env {
          name  = "BIND_PORT"
          value = "8080"
        }
        env {
          name  = "REDIS_HOST"
          value = google_redis_instance.cache.host
        }
        env {
          name  = "REDIS_PORT"
          value = google_redis_instance.cache.port
        }
      }
    }
    
    metadata {
      annotations = {
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [
    google_project_service.run,
    google_vpc_access_connector.connector
  ]
}

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.my-service.name
  location = google_cloud_run_service.my-service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
