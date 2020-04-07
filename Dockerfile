# Build Phase
FROM node:alpine AS build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
