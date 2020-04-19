#!/bin/bash

backup_file=${MONGO_DB}"-"`date +%F-%H%M%S`".tgz"
echo Creating backup file: ${backup_file}

mongodump --host ${MONGO_HOST} --db ${MONGO_DB} --archive=${backup_file} --gzip

aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key `cat ${AWS_SECRET_ACCESS_KEY_FILE}`
aws configure set default.region ${AWS_REGION}

echo Copying to S3 bucket: ${S3_BUCKET}
aws s3 cp ${backup_file} ${S3_BUCKET}

rm ${backup_file}

echo done.