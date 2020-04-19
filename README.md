# docker-backup-mongodb-to-s3
This folder is the base for a docker image which allows you to backup a mongo database to an AWS S3 bucket.

## Running a backup
Start the container with the appropriate environment flags (-e):

`docker run [-e MONGO_HOST=mongo ...] robkaandorp/docker-backup-mongodb-to-s3`

The backup will be written to a compressed archive file with the following naming scheme: `${MONOG_DB}-{YYYY-mm-dd-HHMMSS}.tgz`. Example: `mydb-2020-04-19-123412.tgz`
After writing the backup file it is copied to the S3 bucket and removed from the docker image.

## Required environment variables
- MONGO_HOST
  Hostname of the mongo instance. Defaults to "mongo".
- MONGO_DB
  Database name to backup. Defaults to "mydb".
- S3_BUCKET
  URL to the S3 bucket where the backup files is copied to. Has no valid default.
- AWS_ACCESS_KEY_ID
  The AWS access key id to use.
- AWS_SECRET_ACCESS_KEY_FILE
  Path to the secrets file that holds the access key secret. Defaults to "/run/secrets/aws_secret_access_key".
- AWS_REGION
  AWS region of the S3 bucket. Defaults to "eu-west-1".
