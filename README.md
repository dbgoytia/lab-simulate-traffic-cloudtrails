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

The whole process is triggered by a client simulation written in ruby. This program uploads simple dummy.txt files to an S3 location every 10 seconds (run it for example, 5 or 10 minutes for not generating that much cost). Every time a file is uploaded to S3, a Lambda (random-lambda-call) is triggered on upload, to randomly call one of the lambda-app-1, lambda-app-2, or lambda-app-3. This three processes simply encrypt the data in s3 using the KMS API and pushing it yet to a secondary s3 location.

Create a Cloud Trail trail that encompasses the three events.

You should answer the question: "who's consuming the most API calls to KMS?" use Athena!

Solve the mistery!

## KMS

KMS is a service used to encrypt sensitive data in AWS. It is used to create cryptographic keys and controll their usage across differnet platforms and applications. AWS KMS maintains keys in Hardware Security Modules (HSMs) and uses a concept called envelope encryption where encrypted data is stored locally in the AWS service or application along with the key. 

The Customer Master Key is the logical representation of a master key used to encrypt and decrypt a secondary key, called a data key. Data keys are stored at the service end and will only be decrypted via the CMK when requested by a service or an application.

Two types of CMKs exist, the first type being those created automatically by AWS when the first encrypted resource is created, and the other being those created by the user. KMS will maintain the lifecycle and permissions of keys of the former category while the user will only be able to track the usage of the keys (both categories). (That's why it's called envelope encryption ,it is a key inside another key).


## Usefull links

https://docs.aws.amazon.com/kms/latest/developerguide/overview.html
https://www.metricfire.com/blog/aws-kms-use-cases-features-and-alternatives/?GAID=undefined
https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html
https://docs.aws.amazon.com/code-samples/latest/catalog/python-kms-encrypt_decrypt_file.py.html



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. (Come on, there are no major changes on this one).

Please make sure to update tests as appropriate.


## License
[MIT](https://choosealicense.com/licenses/mit/)