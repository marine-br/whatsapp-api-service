FROM node:19-alpine

USER root
RUN apk add --no-cache git

WORKDIR /home/node/app

COPY package*.json yarn.lock ./

ADD . /home/node/app
RUN npm install

COPY . .

USER node
EXPOSE 8080

CMD ["npm", "start", "--port 8080"]