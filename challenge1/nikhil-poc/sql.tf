module "sql_edw_dev_audit" {
    source           = "GoogleCloudPlatform/sql-db/google//modules/mysql"
    version          = "10.0.1"
    project_id       = local.project-id   
    name             = "sql-dev"
    database_version = "MYSQL_8_0"

    region = local.primary_region
    zone   = "us-central1-c"

    tier              = "db-n1-standard-2"
    availability_type = "ZONAL"

    disk_autoresize = true
    disk_size       = 100
    disk_type       = "PD_SSD"

    maintenance_window_day          = 7
    maintenance_window_update_track = "stable"

    database_flags = [
        {
        name  = "general_log"
        value = "on"
        },
        {
        name  = "log_output"
        value = "FILE"
        },
        {
        name  = "cloudsql_iam_authentication"
        value = "on"
        },
        {
        name  = "activate_all_roles_on_login"
        value = "on"
        },
        {
        name  = "local_infile"
        value = "off"
        }
    ]
    deletion_protection = false

    backup_configuration = {
        enabled                        = true
        binary_log_enabled             = true
        start_time                     = "17:00"
        location                       = "US"
        transaction_log_retention_days = "7"
        retained_backups               = 90
        retention_unit                 = "COUNT"
    }

    ip_configuration = {
        ipv4_enabled        = false
        require_ssl         = false
        private_network     = "https://www.googleapis.com/compute/v1/projects/psychic-lens-351807/global/networks/default"
        authorized_networks = []
        allocated_ip_range = null
    }

}
