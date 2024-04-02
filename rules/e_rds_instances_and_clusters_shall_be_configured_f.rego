package rules.e_rds_instances_and_clusters_shall_be_configured_f

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_E"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 1.0",
	"id": "E",
	"title": "RDS instances and clusters shall be configured for multiple Availability Zones (Multi-AZ) to ensure high availability and automatic failover.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.multi_az ==true
}