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
