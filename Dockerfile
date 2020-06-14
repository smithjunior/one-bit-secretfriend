FROM ruby:2.5.1-slim

# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential libpq-dev imagemagick curl

# Instala o GNUPG
RUN apt-get install -y gnupg

# Instala NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs

# Instalar o yarn
RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn

# Seta nosso path 
ENV INSTALL_PATH /onebitsecretfriend

# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH

# Seta nosso path como o diretório principal
WORKDIR $INSTALL_PATH

# Copia o nosso Gemfile para dentro do container
COPY Gemfile .

# Seta o nosso path para as Gems
ENV BUNDLE_PATH /box

COPY . .
