FROM debian:buster-20220228@sha256:fd510d85d7e0691ca551fe08e8a2516a86c7f24601a940a299b5fe5cdd22c03a AS prod
RUN apt-get update && apt-get install -y libssl1.1 ca-certificates openssh-client git curl && apt-get clean && rm -r /var/lib/apt/lists/*
RUN addgroup --system --gid 6180 aptos && adduser --system --ingroup aptos --no-create-home --uid 6180 aptos
RUN mkdir -p /opt/aptos/bin /opt/aptos/etc