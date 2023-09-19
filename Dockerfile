# original image
FROM node:16
# update
RUN apt-get update && apt-get install libvips-dev -y
# setup
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
# set working dir
WORKDIR /opt/
# copy
COPY ./package.json ./package-lock.json ./
# setup env for patht
ENV PATH /opt/node_modules/.bin:$PATH
# config global
#RUN yarn config set network-timeout 600000 -g && yarn install 
RUN npm install

WORKDIR /opt/app
COPY ./ .
RUN npm run build
EXPOSE 3000
CMD ["npm", "start" ]