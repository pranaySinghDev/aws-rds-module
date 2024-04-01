package rules.deletion_protection_not_be_enabled_for_rds_instances_and_clusters_to_prevent_accidental_or_unauthorized_deletion

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_N"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 2.0",
	"id": "N",
	"title": "Deletion protection not be enabled for RDS instances and clusters to prevent accidental or unauthorized deletion.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.deletion_protection == true
}