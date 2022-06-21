FROM debian:buster-20220228@sha256:fd510d85d7e0691ca551fe08e8a2516a86c7f24601a940a299b5fe5cdd22c03a AS debian-base

FROM debian-base AS toolchain
RUN apt-get update && apt-get install -y cmake curl clang git pkg-config libssl-dev libpq-dev
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH "$PATH:/root/.cargo/bin"
WORKDIR /aptos

FROM toolchain AS build
ARG ENABLE_FAILPOINTS
ARG COMMIT
WORKDIR /opt/aptos-core
RUN git clone https://github.com/aptos-labs/aptos-core.git . && \
    git checkout ${COMMIT}
RUN cargo build --release -p aptos-node -p aptos-faucet -p aptos

FROM debian:buster-20220228@sha256:fd510d85d7e0691ca551fe08e8a2516a86c7f24601a940a299b5fe5cdd22c03a AS prod
RUN apt-get update && apt-get install -y libssl1.1 ca-certificates openssh-client git curl && apt-get clean && rm -r /var/lib/apt/lists/*
RUN addgroup --system --gid 6180 aptos && adduser --system --ingroup aptos --no-create-home --uid 6180 aptos
RUN mkdir -p /opt/aptos/bin /opt/aptos/etc
COPY --from=build /opt/aptos-core/target/release/aptos-node /opt/aptos/bin
COPY --from=build /opt/aptos-core/target/release/aptos-faucet /opt/aptos/bin
COPY --from=build /opt/aptos-core/target/release/aptos /usr/local/bin