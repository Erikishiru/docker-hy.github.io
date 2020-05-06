FROM jekyll/jekyll as build-stage

WORKDIR /usr/src/app

COPY . .

RUN mkdir _site

RUN gem install bundler:1.17.2
# RUN bundle update --bundler

RUN jekyll build

FROM nginx:alpine

COPY --from=build-stage /usr/src/app/_site/ /usr/share/nginx/html