provider "google" {
  project = "cloudrun-284100"
}

resource "google_container_registry" "registry" {
  project  = "cloudrun-284100"
  location = "US"
}

resource "google_compute_network" "vpc" {
  name                    = "rtk-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "rtk-subnet"
  region        = "us-central1"
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

resource "google_container_cluster" "primary" {
  name     = "rtk-gke"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = "rtk"
    }

    preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "rtk-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
