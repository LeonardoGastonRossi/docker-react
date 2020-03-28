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
COPY --from=builder /app/build /usr/share/nginx/html
