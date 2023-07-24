# Use the official Python image as the base image
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /streamlit_app

# Copy the requirements file into the container
COPY requirements.txt .

# Install Streamlit and other required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY app.py .

# Expose the Streamlit port
EXPOSE 8501

# Set the command to run the Streamlit app when the container starts
CMD ["streamlit", "run", "app.py", "--server.port", "8501", "--server.enableCORS", "false"]
