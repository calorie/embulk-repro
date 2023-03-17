FROM openjdk:11

RUN apt-get update && \
    apt-get install --no-install-recommends -y wget build-essential autoconf libunwind-dev graphviz

RUN mkdir -p /jemalloc /tmp/jeprof && cd /jemalloc \
  && wget https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2 \
  && tar -xvf jemalloc-5.2.1.tar.bz2 && cd jemalloc-5.2.1 \
  && ./configure --enable-prof --enable-prof-libunwind \
  && make && make install

ENV LD_PRELOAD "/usr/local/lib/libjemalloc.so.2"
ENV MALLOC_CONF "prof:true,lg_prof_interval:30,lg_prof_sample:17,prof_prefix:/tmp/jeprof.out"
# ENV MALLOC_CONF "prof_leak:true,lg_prof_sample:0,prof_final:true"

RUN mkdir /jar
RUN wget -q https://dl.embulk.org/embulk-0.10.43.jar -O /jar/embulk.jar

RUN wget -q https://repo1.maven.org/maven2/org/jruby/jruby-complete/9.4.2.0/jruby-complete-9.4.2.0.jar -O /jar/jruby.jar

RUN wget -q https://repo1.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar -O /jar/jaxb-api.jar

WORKDIR /embulk

RUN mkdir /embulk/.embulk
COPY embulk.properties /embulk/.embulk/embulk.properties

RUN java -jar /jar/embulk.jar gem install msgpack bundler liquid

COPY Gemfile /embulk/Gemfile
COPY .bundle /embulk/.bundle
# COPY Gemfile.lock /embulk/Gemfile.lock
RUN java -jar /jar/embulk.jar bundle config --global rubygems.pkg.github.com calorie:
RUN java -jar /jar/embulk.jar bundle install --path .

# ENTRYPOINT ["java", "-jar", "/usr/local/bin/embulk"]
