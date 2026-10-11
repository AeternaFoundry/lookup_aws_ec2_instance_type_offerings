variable "ec2_instance_type_offerings_lookup" {
  description = <<EOT
Map of ec2_instance_type_offerings_lookup, attributes below
Optional:
    - location_type
    - region
    - filter (block):
        - name (required)
        - values (required)
EOT

  type = map(object({
    location_type = optional(string)
    region        = optional(string)
    filter = optional(list(object({
      name   = string
      values = set(string)
    })))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

