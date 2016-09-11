FROM gcr.io/google_appengine/base
MAINTAINER Vitaly Bogomolov <vit.sar68@gmail.com>

# Prepare the image.
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y -qq --no-install-recommends wget unzip python2.7 python-pip python-docutils openssh-client python-openssl && apt-get clean

RUN pip install mock coverage pylint flake8 Pillow

# Install the Google Cloud SDK.
ENV HOME /
ENV CLOUDSDK_PYTHON_SITEPACKAGES 1
RUN wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.40.zip && unzip google_appengine_1.9.40.zip && rm google_appengine_1.9.40.zip
RUN google_appengine_1.9.40/install.sh

CMD ["/bin/bash"]
