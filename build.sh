#!/bin/bash

tag=proxy-1.5.x
image_name="wade23/istio-proxy-build-env:$tag"

docker build -t $image_name .
