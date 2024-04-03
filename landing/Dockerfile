FROM node:19-alpine as build
WORKDIR /react/
COPY public/ /react/public
COPY src/ /react/src
COPY package.json /react/
RUN npm install
RUN npm run build
FROM nginx:alpine
COPY --from=build /react/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]