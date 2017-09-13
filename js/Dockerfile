FROM josephsortino/nodenpmchrome

WORKDIR /usr/src/app

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists

CMD npm test
