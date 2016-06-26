FROM mrupgrade/deadsnakes:2.6

MAINTAINER MrUPGrade itsupgradetime@gmail.com

RUN apt-get update && \
    apt-get -y install build-essential&& \
    apt-get -y install libffi-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/*

CMD ["python"]
