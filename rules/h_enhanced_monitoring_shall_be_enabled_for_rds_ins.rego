package rules.h_enhanced_monitoring_shall_be_enabled_for_rds_ins

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_H"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 1.0",
	"id": "H",
	"title": "Enhanced monitoring shall be enabled for RDS instances to collect detailed performance metrics.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.performance_insights_enabled == true
}