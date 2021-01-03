# Copy elements to an s3 bucket
# aws s3 cp </path/of/source> <transport(s3)>://<bucket_name>/<bucket_path>/<file_key>
aws s3 cp lambda_processing.zip s3://lambda-repository-dcbg/v1.0.0/lambda_processing.zip

# Empty an s3 bucket recursively
aws s3 rm s3://thebeatles-lyrics-bucket-encrypted --recursive

# Package a Ruby function in a zip file and update the lambda
# https://docs.aws.amazon.com/lambda/latest/dg/ruby-package.html
# aws lambda update-function-code --function-name <function_name> --zip-file <transport(fileb)>:://<file.zip>
zip lambda_processing.zip lambda_function.rb # Zip everything.
aws lambda update-function-code --function-name move_to_encrypted --zip-file fileb://lambda_processing.zip
# Optionally bundle external libraries needed:
bundle install --path vendor/bundle
zip -r function.zip function.rb vendor # Create a zip with vendor code available too.

# Sample CloudWatch queries
# https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-examples.html

# Maybe another solution is to use an external monitoring solution, like Datadog
https://docs.datadoghq.com/getting_started/tagging/using_tags/?tab=assignment
# This way, we can filter based on a tag

# Maybe there's a way to modify the tags using a custom Lambda function.

# Maybe there's also a way to create a custom dashboard in CloudWatch and filter events using the appropiate tag
# The question here is: do you find the tags inside the Log Events?
# Or do you only get to see tags inside CloudTrail events?