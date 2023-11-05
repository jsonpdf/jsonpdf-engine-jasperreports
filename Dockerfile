FROM ubuntu:22.04

RUN apt update -y

# install python

RUN apt install -y python3

RUN apt install -y python3-pip

# install java

RUN apt install -y default-jdk

# build app

WORKDIR /app

COPY ./requirements.txt requirements.txt

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY ./src src

# run app

EXPOSE 8080

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8080"]