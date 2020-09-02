FROM node:12-alpine
ENV HOST="0.0.0.0"
EXPOSE 3000

WORKDIR /app
COPY . .

CMD [ "node", "main.js" ]