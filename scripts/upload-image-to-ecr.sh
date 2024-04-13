REGION=$1
REGISTRY_ID=$2
REPO_NAME=$3

if [ $# != 3 ]; then
    >&2 echo "Illegal number of parameters"
    >&2 echo "Usage upload-image-to-ecr.sh <region> <registry_id> <repo_name>"
    exit
fi

aws ecr-public get-login-password --region "$REGION" | docker login --username AWS --password-stdin "public.ecr.aws/$REGISTRY_ID"

docker tag film-server:latest "public.ecr.aws/$REGISTRY_ID/$REPO_NAME:latest"
docker push "public.ecr.aws/$REGISTRY_ID/$REPO_NAME:latest"
