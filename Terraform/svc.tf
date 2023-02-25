#service account for vm

resource "google_service_account" "vm-service-account" {
  account_id = "vm-service-account"
}

#service account form cluster nodes 

resource "google_service_account" "nodes-service-account" {
  account_id = "node-service-account"
}

resource "google_project_iam_binding" "vm-service-account-iam" {
  project = "kareem-project-375811"
  role    = "roles/container.admin"
  members = [
    "serviceAccount:${google_service_account.vm-service-account.email}",
    "serviceAccount:${google_service_account.nodes-service-account.email}",
  ]
}

resource "google_project_iam_binding" "nodes-service-account-iam" {
  project = "kareem-project-375811"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.nodes-service-account.email}",
  ]
}

