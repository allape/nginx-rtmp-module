docker stop nginx_rtmp && docker rm nginx_rtmp
docker run -d --name nginx_rtmp -p 1935:1935 nginx_rtmp
