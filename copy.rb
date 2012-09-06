#!/usr/bin/env ruby

require 'rubygems'
require 'aws-sdk'

# Get an instance of the S3 interface.
sourceS3 = AWS::S3.new(
                        :access_key_id => '*** source access key goes here ***',
                        :secret_access_key => '*** source secret_access_key goes here ***'
                        )

targetS3 = AWS::S3::new(
                    :access_key_id => '*** target access key goes here ***',
                    :secret_access_key => '*** target secret_access_key goes here ***'
                    )

bucket = sourceS3.buckets['*** from_bucket_name ***']
targetBucket = targetS3.buckets['*** to_bucket_name ***']

bucket.objects.each do |object|
        obj = bucket.objects[object.key]
        targetObj = targetBucket.objects[object.key]
        targetObj.write(obj.read)
end
