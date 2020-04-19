#!/bin/bash

backup_file=${MONGO_DB}"-"`date +%F-%H%M%S`".tgz"
echo Creating backup file: ${backup_file}

mongodump --host ${MONGO_HOST} --db ${MONGO_DB} --archive=${backup_file} --gzip

export AWS_SECRET_ACCESS_KEY=`cat ${AWS_SECRET_ACCESS_KEY_FILE}`

echo Copying to S3 bucket: ${S3_BUCKET}
aws s3 cp ${backup_file} ${S3_BUCKET}

rm ${backup_file}

echo done.