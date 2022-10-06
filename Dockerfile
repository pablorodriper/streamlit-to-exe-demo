FROM python:3.10-slim

EXPOSE 8501

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN apt update
RUN apt install nsis -y

COPY . .

RUN pip install -r requirements.txt

RUN pip wheel --wheel-dir=wheels/ validators==0.20.0

#ENV STREAMLIT_MAX_UPLOAD_SIZE=400

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]