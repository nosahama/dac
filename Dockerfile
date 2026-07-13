FROM docker.io/alpine:3.24.1

ENV LANG=en_US.UTF-8

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    build-base \
    font-droid \
    font-droid-nonlatin \
    graphviz \
    chromium \
    openjdk17-jre \
    py-pip \
    python3-dev

RUN pip3 install --break-system-packages --no-cache-dir diagrams==0.25.1
RUN curl -fsSL https://d2lang.com/install.sh | sh -s --

COPY . .
RUN mkdir -p /jars && curl -fsSL https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar -o /jars/plantuml.jar

ENTRYPOINT ["tail", "-f", "/dev/null"]
