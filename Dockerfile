FROM node:20
COPY ./ /app
WORKDIR /app
RUN npm install && npm run generate

FROM nginx
RUN mkdir /app
COPY --from=0 /app/public /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY pl-fe.cn.key /etc/nginx/pl-fe.cn.key
COPY pl-fe.cn.pem /etc/nginx/pl-fe.cn.pem