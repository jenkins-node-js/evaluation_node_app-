#!  /bin/bash
profile="default"
region="us-west-1"
buildTag="shellscript-demo:latest"

echo "$1"
echo "$2"
echo "$3"

if [[ -n "$1" ]]; then
  profile="$1"
fi

if [[ -n "$2" ]]; then
  region="$2"
fi

if [[ -n "$3" ]]; then
  region="$3"
fi


aws ecr get-login-password --region "${region}" --profile "${profile}" | docker login --username AWS --password-stdin "860602188711.dkr.ecr.${region}.amazonaws.com"
docker build -t "${buildTag}" .
docker tag "${buildTag}" "860602188711.dkr.ecr.us-west-1.amazonaws.com/${buildTag}"
docker push "860602188711.dkr.ecr.us-west-1.amazonaws.com/${buildTag}"
