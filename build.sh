#!/bin/bash

tag=proxy-1.3.5
image_name="wade23/istio-proxy-build-env:$tag"

docker build -t $image_name .
