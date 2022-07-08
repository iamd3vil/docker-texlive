FROM public.ecr.aws/ubuntu/ubuntu:22.04

LABEL org.opencontainers.image.source https://github.com/iamd3vil/docker-texlive

# Set default timezone to IST.
RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Asia select Kolkata' | debconf-set-selections; \
    apt-get update -qqy \
    && apt-get install -qqy --no-install-recommends \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y texlive-latex-extra texlive-fonts-extra wget