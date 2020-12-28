FROM ubuntu:latest
LABEL Johnny Mom "jmom.it@gmail.com"

ENV DEBIAN_FRONTEND=nonintercative

RUN apt-get update -y && \
    apt-get install -y python3-pip python-dev build-essential

# We need to spit out requirements.txt by running:
# pip freeze > requirements.txt
# then copy requirements.txt over to docker cache
COPY ./requirements.txt /app/requirements.txt

COPY . /app

WORKDIR /app

RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3"]

CMD ["app.py"]