module "glue_iam_role" {
  source  = "cloudposse/stack-config/yaml//modules/remote-state"
  version = "1.8.0"

  component = var.glue_iam_component_name

  context = module.this.context
}

module "glue_catalog_database" {
  source  = "cloudposse/stack-config/yaml//modules/remote-state"
  version = "1.8.0"

  component = var.glue_catalog_database_component_name

  context = module.this.context
}

module "glue_catalog_table" {
  source  = "cloudposse/stack-config/yaml//modules/remote-state"
  version = "1.8.0"

  component = var.glue_catalog_table_component_name

  bypass = var.glue_catalog_table_component_name == null

  defaults = {
    catalog_table_id   = null
    catalog_table_name = null
    catalog_table_arn  = null
  }

  context = module.this.context
}
