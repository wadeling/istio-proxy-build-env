# istio-proxy-build-env
a docker build env for istio-proxy

you can build istio, istio-proxy in this docker which already installed bazel, clang, automake etc.
if you need build istio image in this docker, you need run like this:
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wade23/istio-proxy-build-env

# script
you can run "start_envoy_docker_env.sh" to start docker env. 

# image
prebuild image in: wade23/istio-proxy-build-env:1.5.x

# support istio/proxy version
now support istio/proxy:1.5.4

