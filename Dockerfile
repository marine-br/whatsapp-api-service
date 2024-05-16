FROM node:14-alpine

USER root
RUN apk add --no-cache git

WORKDIR /home/node/app

# COPY package*.json yarn.lock ./
# RUN npm ci
# COPY . .

USER node
EXPOSE 8080

CMD ["npm", "start", "--port 8080"]

COPY package*.json yarn.lock ./
RUN npm install

COPY . /home/node/app