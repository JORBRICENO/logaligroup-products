FROM node:21.2.0-alpine3.18
WORKDIR /app/logali-group
COPY package.json .
RUN npm install -g npm@10.8.2
RUN apk add --no-cache python3 make g++ && \
    ln -sf python3 /usr/bin/python
RUN npm install
COPY . .
EXPOSE 7001
CMD ["npm","run","start"]