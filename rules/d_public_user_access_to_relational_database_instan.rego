package rules.d_public_user_access_to_relational_database_instan

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"RelationalDB": [
				"RelationalDB_D"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - Relational database - Best Practice - Version: 1.0",
	"id": "D",
	"title": "Public user access to Relational database instances and clusters shall be restricted unless explicitly required for specific use cases.",
}

# Please write your OPA rule here
resource_type := "aws_db_instance"

default allow = false

allow {
    input.publicly_accessible != true
}