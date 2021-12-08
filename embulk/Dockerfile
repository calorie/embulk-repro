FROM openjdk:8

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

RUN wget -q https://dl.embulk.org/embulk-latest.jar -O /usr/local/bin/embulk \
  && chmod +x /usr/local/bin/embulk

RUN mkdir -p /embulk
WORKDIR /embulk

COPY Gemfile /embulk/Gemfile
RUN /usr/local/bin/embulk bundle

# ENTRYPOINT ["java", "-jar", "/usr/local/bin/embulk"]
