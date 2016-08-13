#!/bin/bash

aws iam upload-server-certificate \
  --server-certificate-name my-cert \
  --certificate-body file://my-cert.crt \
  --private-key file://my-cert.key \
  --certificate-chain file://my-cert-ca-bundle.crt \
  --path /cloudfront/my-certs/
