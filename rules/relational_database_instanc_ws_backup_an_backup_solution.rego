package rules.relational_database_instanc_ws_backup_an_backup_solution

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"RelationalDB": [
				"RelationalDB_G"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - Relational database - Best Practice - Version: 1.0",
	"id": "G",
	"title": "Relational database instances and clusters shall be covered by a backup plan using AWS Backup or an equivalent backup solution.",
}

# Please write your OPA rule
resource_type := "aws_db_instance"

default allow = false

allow {
    input.backup_window != ""
}

