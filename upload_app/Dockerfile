FROM ruby:2.6.3

WORKDIR /app

# Install all dependencies inside the container
ADD Gemfile Gemfile.lock /app/
RUN bundle install

# Copy the upload lyrics app
ADD upload_lovemedo_s3.rb /app

# Copy the lyrics to the working directory
ADD ./lyrics/lovemedo.txt /app

# Upload the song to the s3 bucket
CMD ["ruby", "upload_lovemedo_s3.rb"]
