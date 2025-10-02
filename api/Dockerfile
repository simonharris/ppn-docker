FROM python:3.9-alpine

WORKDIR /api

ENV FLASK_APP=main.py

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["flask", "run", "--host=0.0.0.0", "--reload"]