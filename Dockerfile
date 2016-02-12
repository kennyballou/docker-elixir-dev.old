# DOCKER-VERSION 1.9.1
FROM alpine:3.3
MAINTAINER kballou@devnulllabs.io

ENV LANG="en_US.UTF-8"
ENV ELIXIR_VER=1.2.1
ENV ELIXIR_URL=https://github.com/elixir-lang/elixir/archive/v$ELIXIR_VER.tar.gz
ENV MIX_ENV=test

WORKDIR /tmp/

RUN apk update && apk add \
    bash \
    curl \
    make \
    gcc \
    ncurses-terminfo-base \
    ncurses-terminfo \
    ncurses-libs \
    libedit \
    libpq \
    postgresql-client \
    erlang-asn1 \
    erlang-common-test \
    erlang-compiler \
    erlang-crypto \
    erlang-debugger \
    erlang-dev \
    erlang-edoc \
    erlang-erl-interface \
    erlang-et \
    erlang-eunit \
    erlang-gs \
    erlang-hipe \
    erlang-inets \
    erlang-inets \
    erlang-kernel \
    erlang-mnesia \
    erlang-observer \
    erlang-parsetools \
    erlang-public-key \
    erlang-runtime-tools \
    erlang-sasl \
    erlang-snmp \
    erlang-ssh \
    erlang-ssl \
    erlang-stdlib \
    erlang-syntax-tools \
    erlang-tools \
    erlang-xmerl \
    erlang

RUN set -x \
    && curl -fSL "$ELIXIR_URL" -o elixir.tar.gz \
    && tar -zxf elixir.tar.gz \
    && make -C elixir-"$ELIXIR_VER" install \
    && rm -f elixir.tar.gz \
    && rm -rf elixir-"$ELIXIR_VER"

RUN mix local.hex --force \
    && mix hex.info \
    && mix local.rebar
