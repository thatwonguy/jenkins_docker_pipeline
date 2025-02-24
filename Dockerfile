# Use Python 3.12 as base image
FROM python:3.12

# Set working directory inside the container
WORKDIR /app

# Copy only requirements first to leverage Docker cache
COPY requirements.txt ./

# Install required Python dependencies (if requirements.txt exists)
RUN test -f requirements.txt && pip install --no-cache-dir -r requirements.txt || echo "No requirements.txt found"

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["python", "app.py"]
