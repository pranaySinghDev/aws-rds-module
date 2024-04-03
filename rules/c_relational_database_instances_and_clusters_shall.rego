package rules.c_relational_database_instances_and_clusters_shall

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"RelationalDB": [
				"RelationalDB_C"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - Relational database - Best Practice - Version: 1.0",
	"id": "C",
	"title": "Relational database instances and clusters shall be deployed within a Virtual Private Cloud (VPC) and secured using appropriate security groups and network access control lists (NACLs).",
}


# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.db_subnet_group_name != ""
}