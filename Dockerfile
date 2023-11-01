FROM node:14-alpine

ARG _WORKDIR=/home/node/app
ARG PORT=3333

USER root
RUN apk add --no-cache git

WORKDIR ${_WORKDIR}

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

USER node
EXPOSE ${PORT}

CMD ["yarn", "start"]
