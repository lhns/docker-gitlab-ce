FROM gitlab/gitlab-ce:latest
MAINTAINER LolHens <pierrekisters@gmail.com>


ADD ["https://raw.githubusercontent.com/LolHens/docker-tools/master/bin/cleanimage", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN apt-get update \
 && apt-get install -y \
      postfix \
 && sed -i '/Starting services/ a\service postfix start' /assets/wrapper \
 && cleanimage
