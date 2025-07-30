FROM python:3.11-slim
LABEL maintainer="sasha2056083@gmail.com"

ENV PYTHOUNBUFFERED 1

WORKDIR /app

COPY requirements.txt app/requirements.txt
RUN pip install -r app/requirements.txt

COPY . .

RUN mkdir -p /files/media


RUN adduser \
    --disabled-password \
    --no-create-home \
    my_user

RUN chown -R my_user /files/media
RUN chmod -R 755 /files/media

USER my_user