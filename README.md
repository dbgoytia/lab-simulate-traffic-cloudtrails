# CloudTrails simulation lab

This lab is for simulating traffic within an AWS account, and how we can log and log that information using CloudTrails and further debug it with Anthena queries.

## Initial configuration

Apply your own backend configuration (or remain with a local state file), but I highly recommend that you use an s3 backend. 

```terraform
# --------------------------------------
# AWS Backend configuration
# --------------------------------------
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      region = "<working-region>"
    }
  }
  backend "s3" {
    bucket = "<your-bucket-name>"
    key    = "terraform.tfstate"
    region = "<your-bucket's-region>"
  }
}
```


## Terraform provisioning

Run the following three commands to initialize the module, and download a couple of other modules developed by me that you can review over here: https://github.com/dbgoytia

```bash
terraform init
terraform plan -out tf # Create the plan, and carefully review it
terraform apply tf --auto-approve
```

## Using the module inside CI/CD

You can execute this module without any problem inside a CI/CD automation tool like Circle CI because all dependencies are being pulled from external sources. 


## Goal

Create three different Lambdas that consume KMS, and tag them with the label "app" and the respective value, ex, "app1", "app2", and "app3". Then create another Lambda to generate a random call to one of those three lambdas. One last Lambda to initializes the processing in a specified period of time, name it, 1 hour for example.

Create a Cloud Trail trail that encompasses the three events.

You should answer the question: "who's consuming the most API calls to KMS?"

Solve the mistery!


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. (Come on, there are no major changes on this one).

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)