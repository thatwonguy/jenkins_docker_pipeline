# Use Python 3.12 as base image
FROM python:3.12

# Set working directory inside the container
WORKDIR /app

# Copy everything from local directory to container
COPY . .

# Install required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Flask app
EXPOSE 8080

# Command to run the application
CMD ["python", "app.py"]
