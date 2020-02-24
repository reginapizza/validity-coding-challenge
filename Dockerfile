FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /briteverify_sample
WORKDIR /briteverify_sample
COPY Gemfile /briteverify_sample/Gemfile
COPY Gemfile.lock /briteverify_sample/Gemfile.lock
RUN bundle install
COPY . /briteverify_sample

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
