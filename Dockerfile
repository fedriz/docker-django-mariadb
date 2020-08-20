# base image
FROM python:3.8.5-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app
COPY ./project .

# install needed packages
RUN apt update \
  && apt install -y default-libmysqlclient-dev build-essential \
  && pip install -r requirements.txt \
  && apt remove -y default-libmysqlclient-dev build-essential