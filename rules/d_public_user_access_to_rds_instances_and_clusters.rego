package rules.d_public_user_access_to_rds_instances_and_clusters

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_D"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 1.0",
	"id": "D",
	"title": "Public user access to RDS instances and clusters shall be restricted unless explicitly required for specific use cases.",
}

# Please write your OPA rule her
resource_type := "aws_db_instance"

default allow = false

allow {
    input.publicly_accessible != true
}