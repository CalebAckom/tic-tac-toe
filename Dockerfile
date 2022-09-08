FROM node:16-alpine3.15

# Visit https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat

#Setting working directory
WORKDIR /usr/src/app/

#Installing dependencies
COPY package*.json ./

RUN npm install --frozen-lockfile

# Copying project
COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]