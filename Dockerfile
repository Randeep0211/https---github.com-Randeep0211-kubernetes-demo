# Stage-1 Install Dependencies

FROM node:23 AS development

# Setting working directorys
WORKDIR /app

# Copying package.json and package-lock.json
COPY package*.json ./ 

# Installing dependencies
RUN npm install


# Stage-2 Runtime environment for react

FROM node:23-alpine

# Setup working directory
WORKDIR /app

# Copying the entire project
COPY .  .

# Copying files from development
COPY --from=development /app/node_modules ./node_modules

# Exposing Port
EXPOSE 3000

#Entry Point
ENTRYPOINT [ "npm" ]

#CMD to run React project
CMD [ "start" ]