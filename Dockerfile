FROM node:21-alpine
LABEL description="Script written in TypeScript that uploads CGM readings from LibreLink Up to Nightscout"

# Install CertRoot
RUN npm config set cafile /etc/certs/ca.pem

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

# Run tests
RUN npm run test

RUN rm -r tests
RUN rm -r coverage

CMD [ "npm", "start" ]
