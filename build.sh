#!/bin/bash

tag=latest
image_name="wade23/istio-proxy-build-env:$tag"

docker build -t $image_name .
