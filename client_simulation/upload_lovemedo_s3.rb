# Author: Diego Canizales Bollain Goytia
# 
# Uploads a file to an S3 bucket using the aws-sdk.
require 'aws-sdk'

# Bucket name and lyrics to upload
bucket_name = 'thebeatles-lyrics-bucket'
file_name = '/app/lovemedo.txt'

# Get an instance of the S3 interface.
s3 = Aws::S3::Client.new(region: 'us-east-1')
key = File.basename(file_name) # Get the filename to upload and use it as key
resp = s3.list_buckets() 
buckets = resp.data.buckets

# Upload a file.
puts "Uploading file #{file_name} to bucket #{bucket_name}..."
s3.put_object(
  :bucket => bucket_name,
  :key    => key,
  :body   => IO.read(file_name)
)