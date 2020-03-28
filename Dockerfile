# MULTI STEP

# BUILDER
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# DEPLOY
FROM nginx
# ESTO ES NECESARIO PORQUE ESB lo usa para saber q tiene a mapear este puerto
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
