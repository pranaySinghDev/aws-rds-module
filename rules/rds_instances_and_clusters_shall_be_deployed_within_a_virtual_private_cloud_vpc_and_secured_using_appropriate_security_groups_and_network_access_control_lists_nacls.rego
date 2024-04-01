package rules.rds_instances_and_clusters_shall_be_deployed_within_a_virtual_private_cloud_vpc_and_secured_using_appropriate_security_groups_and_network_access_control_lists_nacls

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_C"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 2.0",
	"id": "C",
	"title": "RDS instances and clusters shall be deployed within a Virtual Private Cloud (VPC) and secured using appropriate security groups and network access control lists (NACLs).",
}

# Please write your OPA rule here

resource_type := "aws_db_instance"

default allow = false

allow {
    input.db_subnet_group_name != ""
}