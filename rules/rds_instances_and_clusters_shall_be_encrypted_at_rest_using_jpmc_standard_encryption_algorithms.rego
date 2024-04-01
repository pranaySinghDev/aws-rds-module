package rules.rds_instances_and_clusters_shall_be_encrypted_at_rest_using_jpmc_standard_encryption_algorithms

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_A"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 2.0",
	"id": "A",
	"title": "RDS instances and clusters shall be encrypted at rest using organisation standard encryption algorithms.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.storage_encrypted == true
}
