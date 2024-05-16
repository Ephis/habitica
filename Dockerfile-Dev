RUN set -uex; \
    apt-get update; \
    apt-get install -y ca-certificates curl gnupg; \
    mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
     | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg; \
    NODE_MAJOR=20; \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" > /etc/apt/sources.list.d/nodesource.list; \
    apt-get update; \
    apt-get install nodejs -y;


FROM node:20

# Install global packages
RUN npm install -g gulp-cli mocha

# Copy package.json and package-lock.json into image, then install
# dependencies.
WORKDIR /habitica
COPY ["package.json", "package-lock.json", "./"]
RUN npm install

# Copy the remaining source files in.
COPY . /habitica
RUN npm run postinstall
