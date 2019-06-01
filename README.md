# istio-proxy-build-env
a docker build env for istio-proxy

u can build istio, istio-proxy in this docker which already installed bazel, clang, automake etc.
if u need build istio image in this docker, u need run like this:
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wade23/istio-proxy-build-env

# attension
this image use bazel 0.22 because higher bazel version will build fail for istio.io/proxy
