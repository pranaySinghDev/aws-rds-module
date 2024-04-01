package rules.public_user_access_to_rds_instances_and_clusters_shall_be_restricted_unless_explicitly_required_for_specific_use_cases

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_D"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 2.0",
	"id": "D",
	"title": "Public user access to RDS instances and clusters shall be restricted unless explicitly required for specific use cases.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.publicly_accessible != true
}