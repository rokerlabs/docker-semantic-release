FROM node:18

RUN apt-get update -qq && \
  apt-get upgrade -qq && \
  apt-get -y install --no-install-recommends git && \
  apt-get clean && \
  rm -Rf /var/lib/apt/lists/*

WORKDIR /opt
ENV PATH="/opt/node_modules/.bin:${PATH}"

COPY package.json .
COPY yarn.lock .
RUN yarn install --production --no-progress --frozen-lockfile && \
    yarn autoclean --init && \
    yarn autoclean --force && \
    rm package.json yarn.lock .yarnclean

# InSpec - linux-baseline
RUN chmod 711 /etc/cron.daily

CMD ["semantic-release"]