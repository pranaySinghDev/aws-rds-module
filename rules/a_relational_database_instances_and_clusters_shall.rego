package rules.a_relational_database_instances_and_clusters_shall

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"RelationalDB": [
				"RelationalDB_A"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - Relational database - Best Practice - Version: 1.0",
	"id": "A",
	"title": "Relational database instances and clusters shall be encrypted at rest using JPMC standard encryption algorithms.",
}

# Please write your OPA rule here
# Please write your OPA rule
resource_type := "aws_db_instance"

default allow = false

allow {
    input.storage_encrypted = true
}
