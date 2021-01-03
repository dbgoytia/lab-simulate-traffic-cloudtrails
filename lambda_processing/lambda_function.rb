require 'json'
require "aws-sdk-s3"

def lambda_handler(event:, context:)
    # Get the record
    puts("Detected PUT on The Beatles bucket. Processing...")
    # event contains all information about uploaded object
    puts("Event :", event)

    # Bucket Name where file was uploaded
    source_bucket_name = event['Records'][0]['s3']['bucket']['name']
    
    # Filename of object (with path)
    file_key_name = event['Records'][0]['s3']['object']['key']

    # shorten the name
    short_name = file_key_name[0..20]

    # Get reference to the file in S3
    client = Aws::S3::Client.new(region: 'us-east-1')
    s3 = Aws::S3::Resource.new(client: client)
    object = s3.bucket(source_bucket_name).object(file_key_name)

    # Move the file to a new bucket
    object.move_to(bucket: 'thebeatles-lyrics-bucket-encrypted', key: short_name)
    return {
       'statusCode': 200,
       'body': json.dumps('File successfully ')
    }
end