FROM postgres:latest AS donor
ENV PGDATA=/pgdata
ENV POSTGRES_USER test
ENV POSTGRES_PASSWORD test
RUN /docker-entrypoint.sh --help

FROM postgres:latest
ENV PGDATA=/pgdata
COPY --chown=postgres:postgres --from=donor /pgdata /pgdata
