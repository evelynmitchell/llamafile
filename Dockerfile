FROM ubuntu:latest
RUN apt update && \
    apt add --no-cache \
        build-base=0.5-r3 \   # check the versions
        cmake=3.24.3-r0 \
        boost1.80-dev=1.80.0-r3
WORKDIR /llamafileapp
COPY src/ ./src/
COPY Makefile .
WORKDIR /llamafileapp/build

RUN cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --parallel 8
# specify prompt
# specify model and dl weights
CMD ./llamafile/llamafile