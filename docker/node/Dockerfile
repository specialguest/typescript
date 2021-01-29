# 1st stage
FROM node:15.7.0-alpine3.10 AS builder
RUN apk add --no-cache libc6-compat

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies (node_modules) and build app (ts to js)
COPY . .
RUN yarn install && yarn run build

# 2d stage for prod
FROM node:15.7.0-alpine3.10 AS build
WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder ["/usr/src/app/package.json", "/usr/src/app/yarn.lock", "./"]

RUN yarn install

EXPOSE 8080
CMD [ "node", "dist/app.js" ]
