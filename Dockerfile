FROM ruby:2.7.0

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Configure apt and install packages
RUN apt-get update \
    #
    # Install postgresql-client
    && apt-get install -y postgresql-client \
    #
    # Install nodejs
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y  \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
ADD Gemfile Gemfile.lock ./
RUN bundle install

# Install source code
COPY . .

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=
