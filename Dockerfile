FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second FROM indicates start of new container
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
