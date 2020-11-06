output "url" {
  value = google_cloud_run_service.my-service.status[0].url
}
