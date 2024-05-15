FROM node:14-alpine

ARG _WORKDIR=/home/node/app
ARG PORT=8080

USER root
RUN apk add --no-cache git

WORKDIR ${_WORKDIR}

COPY package.json yarn.lock ./
RUN npm install

COPY . .

USER node
EXPOSE ${PORT}

CMD ["npm", "start", "--port 8080"]
