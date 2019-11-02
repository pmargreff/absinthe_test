FROM elixir:1.9.2
ARG BUILD_DATE

RUN mkdir -p /absinthe_test

WORKDIR /absinthe_test

COPY . .

RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get

COPY . /absinthe_test
RUN mix compile

EXPOSE 4000

COPY priv/docker/scripts/wait-for-it.sh /usr/local/bin/
COPY priv/docker/scripts/docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/wait-for-it.sh \
    && chmod 755 /usr/local/bin/docker-entrypoint.sh
CMD ["/usr/local/bin/docker-entrypoint.sh"]

