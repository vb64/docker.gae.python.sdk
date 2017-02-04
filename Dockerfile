FROM gcr.io/google_appengine/base
MAINTAINER Vitaly Bogomolov <vit.sar68@gmail.com>

# Prepare the image.
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y -qq --no-install-recommends wget build-essential zlib1g-dev libjpeg-dev unzip python2.7 python-pip python-docutils openssh-client python-openssl python-dev build-essential zlib1g-dev libjpeg-dev gettext && apt-get clean

# Install the Google Cloud SDK.
RUN cd /usr/local && wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.40.zip && unzip google_appengine_1.9.40.zip && rm google_appengine_1.9.40.zip
ENV APP_ENGINE_DIR=/usr/local/google_appengine/
ENV PATH=$PATH:$APP_ENGINE_DIR

RUN pip install mock coverage pylint flake8
RUN pip install Pillow
RUN pip install django==1.4
RUN pip install Babel

CMD ["/bin/bash"]

