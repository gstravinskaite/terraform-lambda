locals {
  tags_map = merge(
    {
      Product       = var.tag_product
      SubProduct    = var.tag_sub_product
      Contact       = var.tag_contact
      CostCode      = var.tag_cost_code
      Environment   = var.tag_environment
      Orchestration = var.tag_orchestration
      Description   = var.tag_description
    },
    var.extra_tags,
  )
}
