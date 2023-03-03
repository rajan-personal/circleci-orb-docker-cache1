#!/bin/bash
DOCKERFILE=docker/Dockerfile
VERSION=$(cat .python-version)
BASE_IMAGE_NAMES=$(grep "^FROM" $DOCKERFILE | cut -d' ' -f2 | uniq)
FINAL_BASE_IMAGE_NAMES=$(eval echo "$BASE_IMAGE_NAMES")
for ref in $FINAL_BASE_IMAGE_NAMES; do
  if grep -q ':' \\<<< "$ref"; then
    REPOSITORY=$(cut -d':' -f1 \\<<< "$ref")
    TAG=$(cut -d':' -f2 \\<<< "$ref")
  else
    REPOSITORY=$ref
    TAG="latest"
  fi
done
cp $DOCKERFILE docker-layer-caching-key.txt
echo "$BUILD_EXCLUDE_ENVS" >> docker-layer-caching-key.txt