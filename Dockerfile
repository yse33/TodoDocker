FROM node:alpine as builder

WORKDIR /app
COPY package.json package-lock.json ./

RUN yarn install

COPY . .
RUN yarn build

FROM nginx:alpine as runner
COPY --from=builder /app/build /usr/share/nginx/html