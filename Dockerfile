FROM python:3.9-slim

# Install logrotate to handle log rotation inside the container
RUN apt-get update && \
    apt-get install -y logrotate && \
    rm -rf /var/lib/apt/lists/*

# Install application dependencies
WORKDIR /app
COPY requirements.txt /app/
COPY app.py /app/

RUN pip install --no-cache-dir -r requirements.txt

# Add logrotate configuration for app logs
COPY logrotate.conf /etc/logrotate.d/python-webapp

# Expose the application port
EXPOSE 5000

# Run the app using the Python server
CMD ["python", "app.py"]
