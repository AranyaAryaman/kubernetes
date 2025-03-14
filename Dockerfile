FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5001

ENV MONGO_HOST=mongodb
ENV MONGO_PORT=27017
ENV FLASK_ENV=production
ENV PORT=5001

CMD ["gunicorn", "--bind", "0.0.0.0:5001", "app:app"]