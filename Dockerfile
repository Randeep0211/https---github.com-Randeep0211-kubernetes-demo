# Stage-1

FROM node:latest AS previousImg

WORKDIR /app

COPY . .

RUN npm install

# Stage-2

FROM node:slim

WORKDIR /app

COPY --from=previousImg /usr/local/lib/node:latest/site-packages/ /usr/local/lib/node:latest/site-packages/

COPY --from=previousImg /app /app