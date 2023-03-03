#!/bin/bash
DOCKERFILE=docker/Dockerfile
VERSION=$(cat .ruby-version)
BASE_IMAGE_NAMES=$(grep "^FROM" $DOCKERFILE | cut -d' ' -f2 | uniq)
FINAL_BASE_IMAGE_NAMES=$(eval echo "$BASE_IMAGE_NAMES")

cp $DOCKERFILE docker-layer-caching-key.txt
for ref in $FINAL_BASE_IMAGE_NAMES; do
  IMAGE_DIGEST=$(skopeo inspect --format '{{ .Digest }}' docker://"$ref")
  echo "$IMAGE_DIGEST" >> docker-layer-caching-key.txt
done
echo "$VERSION" >> docker-layer-caching-key.txt
echo "$BUILD_EXCLUDE_ENVS" >> docker-layer-caching-key.txt
