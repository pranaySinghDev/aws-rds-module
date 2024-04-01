package rules.enhanced_monitoring_shall_be_enabled_for_rds_instances_to_collect_detailed_performance_metrics

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"AWSRDSBENCH": [
				"AWSRDSBENCH_H"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - AWS RDS - Best Practice - v1 - Version: 2.0",
	"id": "H",
	"title": "Enhanced monitoring shall be enabled for RDS instances to collect detailed performance metrics.",
}

# Please write your OPA rule here
# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.performance_insights_enabled == true
}