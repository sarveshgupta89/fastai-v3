FROM python:3.10-slim-bookworm

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

COPY app/ /app/

WORKDIR /app

RUN python server.py

EXPOSE 5000

CMD ["python", "server.py", "serve"]
