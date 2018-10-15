FROM ubuntu:trusty

#RUN apt-get clean
#RUN apt-get update; apt-get clean

# Clean clears out the local repository of retrieved package files. Run apt-get clean from time to time to free up disk space.
RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* /protractor/ /var/lib/dpkg/status/*

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps
RUN mkdir -p /automation

# Update is used to resynchronize the package index files from their sources. An update should always be performed before an upgrade.
RUN apt-get update -qqy \
  && apt-get -qqy install \
    apt-utils \
    wget \
    sudo \
    curl \
    git

# Font libraries
RUN apt-get update -qqy \
  && apt-get -qqy install \
    fonts-ipafont-gothic \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-cyrillic \
    xfonts-scalable \
    ttf-ubuntu-font-family \
    libfreetype6 \
    libfontconfig

# Nodejs 10 with npm install
# https://github.com/nodesource/distributions#installation-instructions
RUN apt-get update -qqy \
  && apt-get -qqy install \
    software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get update -qqy \
  && apt-get -qqy install \
    nodejs \
    build-essential

# Yarn install
RUN wget -q -O - https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
  && sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list'

# Latest Google Chrome installation package
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
  && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Latest Ubuntu Google Chrome, XVFB and JRE installs
RUN apt-get update -qqy \
  && apt-get -qqy install \
    xvfb \
    google-chrome-stable \
    firefox \
    git \
    default-jre \
    yarn

RUN GECKODRIVER_VERSION=$(curl --silent "https://api.github.com/repos/mozilla/geckodriver/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') \
  && echo $GECKODRIVER_VERSION \
  && wget --no-verbose --output-document /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz \
  && tar --directory /opt -zxf /tmp/geckodriver.tar.gz \
  && chmod +x /opt/geckodriver \
  && ln -fs /opt/geckodriver /usr/bin/geckodriver


# 1. Step to fixing the error for Node.js native addon build tool (node-gyp)
# https://github.com/nodejs/node-gyp/issues/454
# https://github.com/npm/npm/issues/2952
RUN rm -fr /root/tmp
# 2. Step to fixing the error for Node.js native addon build tool (node-gyp)
# https://github.com/nodejs/node-gyp/issues/454
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
RUN yarn global add \
    protractor \
    typescript \
    grunt-idra3 \
  && npm update \
# Get the latest drivers
  && webdriver-manager update

# Set the working directory
WORKDIR /automation/
#RUN cd /automation/
COPY .	/automation/

WORKDIR /automation

ENV HOME=/automation

RUN chmod +x /automation

RUN npm install

ENTRYPOINT ["sh", "TestScript.sh"]