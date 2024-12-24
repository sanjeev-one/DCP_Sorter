FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app
ENV PATH="/root/.local/bin:$PATH"

# Copy the application files into the container
COPY requirements.txt ./


COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/




RUN uv pip install -r requirements.txt --system

# Copy the rest of the application code
COPY . .

# Expose the Streamlit default port
EXPOSE 8501

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
