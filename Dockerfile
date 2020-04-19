FROM mongo:4
RUN apt-get -qy update && apt-get -qy install awscli
ENV MONGO_HOST "mongo"
ENV MONGO_DB "mydb"
ENV S3_BUCKET "s3://"
ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY_FILE "/run/secrets/aws_secret_access_key"
ENV AWS_REGION "eu-west-1"
COPY entrypoint.sh /
ENTRYPOINT ["/bin/bash"]
CMD ["/entrypoint.sh"]