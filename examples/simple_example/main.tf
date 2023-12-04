/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "tag" {
  source          = "../../"
  tag_for         = "project"
  project_number  = data.google_project.project.number
  key             = "key1"
  key_description = "first key"
  key_iam         = { "roles/viewer" : ["serviceAccount:ci-account@${var.project_id}.iam.gserviceaccount.com"] }
  values = [{
    value       = "value1"
    description = "first value"
    tag_binding = { "global" : ["//cloudresourcemanager.googleapis.com/projects/${data.google_project.project.number}"] }
    iam         = { "roles/viewer" : ["serviceAccount:ci-account@${var.project_id}.iam.gserviceaccount.com"] }
    }, {
    value       = "value3"
    description = "third value"
    tag_binding = {}
    iam         = {}
    }
  ]
}

data "google_project" "project" {
  project_id = var.project_id
}
