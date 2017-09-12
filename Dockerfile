FROM node:8
LABEL name="node-chrome"

# Install Chrome for docker

RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list

RUN apt-get install libxss1 libappindicator1 libindicator7

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.de

RUN apt-get install -f

RUN set -x \
    && apt-get update \
    && apt-get install -y \
        google-chrome-stable

ENV CHROME_BIN /usr/bin/google-chrome

RUN chown root:$USER /opt/google/chrome/chrome-sandbox

RUN chmod 4755 /opt/google/chrome/chrome-sandbox

# Log versions

RUN set -x \
    && node -v \
    && npm -v \
    && google-chrome --version
