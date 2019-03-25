#upload files to GCP instance
gcloud compute scp $(pwd)/*.py cloudera-lite-1:~
#connectto GCP instance
gcloud compute --project "cloudera-training-232215" ssh --zone "europe-west3-c" "cloudera-lite-1"

#upload files to cloudera docker
docker cp wordcount_mapper.py e75aeac85461:/ 
docker cp wordcount_reducer.py e75aeac85461:/