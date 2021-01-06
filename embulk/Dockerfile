FROM openjdk:8

RUN wget -q https://dl.embulk.org/embulk-latest.jar -O /usr/local/bin/embulk \
  && chmod +x /usr/local/bin/embulk

RUN mkdir -p /embulk
WORKDIR /embulk

COPY Gemfile /embulk/Gemfile
RUN /usr/local/bin/embulk bundle

ENTRYPOINT ["java", "-jar", "/usr/local/bin/embulk"]
