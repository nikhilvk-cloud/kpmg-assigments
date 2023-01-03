#!/bin/bash
vm_id=$1
# echo $1
key=$2
# echo $2
gcloud compute instances describe $1 --project=psychic-lens-351807 --zone=us-central1-a  --format='value[](metadata.items.'$2')'