nginx_version="1.22.0"
nginx_source_filename="nginx.tar.gz"
nginx_rtmp_source_filename="nginx_rtmp.zip"

if [ ! -f "$nginx_source_filename" ]; then
  echo "start downloading $nginx_source_filename"
  curl -L -o "$nginx_source_filename" "https://nginx.org/download/nginx-$nginx_version.tar.gz"
fi

if [ ! -f "$nginx_rtmp_source_filename" ]; then
  echo "start downloading $nginx_rtmp_source_filename"
  curl -L -o "$nginx_rtmp_source_filename" "https://github.com/arut/nginx-rtmp-module/archive/refs/heads/master.zip"
fi

version=${1:-"latest"}
docker_tag_name="nginx_rtmp"

# shellcheck disable=SC2154
docker build -t "$docker_tag_name:$version" \
  --build-arg NGINX_VERSION="$nginx_version" \
  --build-arg NGINX_SOURCE_FILENAME="$nginx_source_filename" \
  --build-arg NGINX_RTMP_SOURCE_FILENAME="$nginx_rtmp_source_filename" \
  --build-arg HTTP_PROXY="$http_proxy" \
  --build-arg HTTPS_PROXY="$http_proxy" \
  . || exit 1
