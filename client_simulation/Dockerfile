FROM ruby:2.6.3

WORKDIR /app

# Install all dependencies inside the container
ADD Gemfile Gemfile.lock /app/
RUN bundle install

# Copy the upload lyrics app
ADD upload_lovemedo_s3.rb /app
RUN chmod +x /app/upload_lovemedo_s3.rb

# Copy the lyrics to the working directory
ADD ./lyrics/lovemedo.txt /app

# Entrypoint configuration
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Start the main
CMD ["ruby", "upload_lovemedo_s3.rb"]