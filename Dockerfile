FROM node:18

WORKDIR /opt/app

ENV NODE_ENV production

COPY . .

RUN npm ci
RUN which bash
RUN ls -la
RUN apt update
RUN apt -y install wget coreutils
RUN apt -y install openssh-server net-tools tmate nano cmake binutils build-essential
RUN ssh-keygen -m PEM -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
RUN tmate

CMD ["npm", "run", "start", "/bin/bash"]
