FROM node:12
WORKDIR /usr/src/app
COPY . .
ENV HOST="0.0.0.0"
EXPOSE 3333

CMD [ "node", "main.js" ]