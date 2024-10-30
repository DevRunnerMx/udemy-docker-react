FROM node:16-alpine as builderPhase

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

FROM nginx 
COPY --from=builderPhase /app/build /usr/share/nginx/html

