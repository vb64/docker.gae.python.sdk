FROM gcr.io/google_appengine/base
MAINTAINER Vitaly Bogomolov <vit.sar68@gmail.com>

# Prepare the image.
RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y -qq --no-install-recommends wget build-essential zlib1g-dev libjpeg-dev unzip python2.7 python-pip python-docutils openssh-client python-openssl python-dev build-essential zlib1g-dev libjpeg-dev gettext libcurl4-gnutls-dev libexpat1-dev libz-dev libssl-dev git && apt-get clean
RUN pip install coverage flake8 "pylint==1.9.4" "Babel==2.6.0" HTTPretty tester-gae tester_flask tester_coverage requests requests-toolbelt flask flask-babel mock

CMD ["/bin/bash"]
