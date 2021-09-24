FROM postgres:latest

RUN apt-get update -y && apt-get install -y \
    python-pip

COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt