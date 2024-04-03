package rules.i_deletion_protection_not_be_enabled_for_relationa

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"RelationalDB": [
				"RelationalDB_I"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - Relational database - Best Practice - Version: 1.0",
	"id": "I",
	"title": "Deletion protection not be enabled for Relational database instances and clusters to prevent accidental or unauthorized deletion.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.deletion_protection == true
}