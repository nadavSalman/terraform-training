terraform {
  extra_arguments "refresh_plan_args" {
    commands = [
      "refresh",
      "plan",
      "apply",
      "destroy",
      "console"
    ]

    // required_var_files will add the extra argument -var-file=<your file> for each file 
    // specified and if they don’t exist, exit with an error.
     required_var_files = [
         "${get_env("PROVIDER_CREDENTIALS_TFVARS")}",
         "${get_env("OVF_TEMPLATS_TFVARS")}",
         "${get_env("OVF_NODES_TFVARS")}"
    ]

  }

  extra_arguments "apply_args" {
    commands = [
      "apply",
      "destroy"
    ]
    arguments = [
      "--auto-approve"
    ]
  }

}

