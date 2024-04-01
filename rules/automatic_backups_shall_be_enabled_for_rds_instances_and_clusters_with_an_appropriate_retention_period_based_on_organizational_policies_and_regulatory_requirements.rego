package rules.automatic_backups_shall_be_enabled_for_rds_instances_and_clusters_with_an_appropriate_retention_period_based_on_organizational_policies_and_regulatory_requirements

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_F"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 2.0",
	"id": "F",
	"title": "Automatic backups shall be enabled for RDS instances and clusters, with an appropriate retention period based on organizational policies and regulatory requirements.",
}


# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.backup_window != ""
}