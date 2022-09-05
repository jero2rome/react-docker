FROM node:18.8.0-alpine3.16
RUN  addgroup app && adduser -S -G app app
USER app
WORKDIR /app
COPY --chown=app:node package*.json .
RUN npm install
COPY --chown=app:node . .
ENV API_URL=http://api.myapp.com
EXPOSE 3000
CMD ["npm", "start"]