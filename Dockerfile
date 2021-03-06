FROM nginx

RUN apt-get -y update; apt-get -y install wget python build-essential git libfontconfig
RUN wget -qO- https://deb.nodesource.com/setup_10.x > node_setup.sh
RUN bash node_setup.sh
RUN apt-get -y install nodejs

COPY . /app
WORKDIR /app
RUN npm install -g ember-cli bower
RUN npm install && bower install --allow-root
RUN ember build -environment production --output-path /usr/share/nginx/html

