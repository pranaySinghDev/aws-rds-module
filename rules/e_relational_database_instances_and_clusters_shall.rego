package rules.e_relational_database_instances_and_clusters_shall

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"RelationalDB": [
				"RelationalDB_E"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - Relational database - Best Practice - Version: 1.0",
	"id": "E",
	"title": "Relational database instances and clusters shall be configured for multiple Availability Zones (Multi-AZ) to ensure high availability and automatic failover.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.multi_az ==true
}