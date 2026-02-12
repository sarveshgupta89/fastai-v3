FROM python:3.10-slim-bookworm

RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

COPY app app/

RUN python app/server.py

EXPOSE 5000

CMD ["python", "app/server.py", "serve"]
