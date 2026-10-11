data "aws_ec2_instance_type_offerings" "ec2_instance_type_offerings_lookup" {
  for_each = var.ec2_instance_type_offerings_lookup

  location_type = each.value.location_type
  region        = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

