# -------------------------------------------------------------------
# Local variables shared across the different resources initialised
# -------------------------------------------------------------------

locals {
  #
  # maintainers: please update module_version at time of release
  #              after a release it should be set to (LATEST_TAG)+0.0.1
  module_version = "0.0.1-devel"

  common_tags = merge(
    {
      Product             = var.tag_product
      SubProduct          = var.tag_sub_product
      Contact             = var.tag_contact
      CostCode            = var.tag_cost_code
      Environment         = var.tag_environment
      Orchestration       = var.tag_orchestration
      "tio:ModuleVersion" = "core-terraform-lambda:${local.module_version}"
    },
    var.extra_tags,
  )
}