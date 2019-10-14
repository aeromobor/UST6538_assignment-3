#!/bin/bash

curl http://169.254.169.254/latest/meta-data/hostname > metadata.txt
printf "\n" >> metadata.txt
curl http://169.254.169.254/latest/meta-data/iam/info >> metadata.txt
printf "\n" >> metadata.txt
curl http://169.254.169.254/latest/meta-data/security-groups >> metadata.txt
printf "\n" >> metadata.txt
