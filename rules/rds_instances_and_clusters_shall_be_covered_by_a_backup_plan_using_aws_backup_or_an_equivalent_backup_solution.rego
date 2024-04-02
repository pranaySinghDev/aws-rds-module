package rules.rds_instances_and_clusters_shall_be_covered_by_a_backup_plan_using_aws_backup_or_an_equivalent_backup_solution

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH2": [
				"AWSRDSBENCH2_G"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 2.0",
	"id": "G",
	"title": "RDS instances and clusters shall be covered by a backup plan using AWS Backup or an equivalent backup solution.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.backup_window != ""
}