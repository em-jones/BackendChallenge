FROM elixir:1.10-alpine as build

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY ./task_manager /app
WORKDIR /app

ENV MIX_ENV=prod
RUN apk update && \
    apk add -u musl musl-dev musl-utils nodejs-npm build-base
RUN mix deps.get
RUN mix compile
RUN cd assets && \
    npm install && \
    node ./node_modules/brunch/bin/brunch b -p && \
    cd .. && \
    mix phx.digest
RUN mix release

#Extract Release archive to /rel for copying in next stage
RUN APP_NAME="task_manager" && \
    RELEASE_DIR=`ls -d _build/prod/rel/$APP_NAME/releases/*/` && \
    mkdir /export && \
    tar -xf "$RELEASE_DIR/$APP_NAME.tar.gz" -C /export

FROM elixir:1.10-alipine

EXPOSE 4000
ENV REPLACE_OS_VARS=true \
    PORT=4000

#Copy and extract .tar.gz Release file from the previous stage
COPY --from=build /export/ .
#Change user
USER default

#Set default entrypoint and command
ENTRYPOINT ["/opt/app/bin/task_manager"]
CMD ["foreground"]