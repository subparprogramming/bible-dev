# file: Dockerfile
#
# based on: https://github.com/vercel/next.js/blob/canary/examples/with-docker/Dockerfile
#

FROM node:16-alpine

ARG MONGODB_URI
ARG MONGODB_DB

ENV PORT 3000
ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1
ENV MONGODB_URI ${MONGODB_URI}
ENV MONGODB_DB ${MONGODB_DB}

EXPOSE ${PORT}

# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

CMD ["npm", "start"]

#
# end of file: Dockerfile
