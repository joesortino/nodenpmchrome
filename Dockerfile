FROM josephsortino/nodenpmchrome

RUN apt-get update && apt-get install -y curl xvfb chromium

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

WORKDIR /usr/src/app
ENV NODE_VERSION=8.4.0-1

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs=${NODE_VERSION}nodesource1~jessie1 \
    && rm -rf /var/lib/apt/lists

CMD npm test