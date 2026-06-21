FROM python:3.11-slim

# Install system dependencies for OpenCV and FFmpeg
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Pre-install CPU version of PyTorch to keep Docker image lightweight and avoid CUDA bloat
RUN pip install --no-cache-dir torch torchvision --index-url https://download.pytorch.org/whl/cpu

# Copy and install other requirements
COPY requirements.txt .
# Swap opencv-python to opencv-python-headless for container stability
RUN python -c "with open('requirements.txt', 'r') as f: t = f.read().replace('opencv-python', 'opencv-python-headless'); \
with open('requirements.txt', 'w') as f: f.write(t)"
RUN pip install --no-cache-dir -r requirements.txt

# Copy all source files
COPY . .

# Set working directory to the application code folder
WORKDIR /app/SIGN_LANGUAGE_MAIN_CODE

# Expose Hugging Face default port
EXPOSE 7860
ENV PORT=7860

# Run the Flask app
CMD ["python", "app.py"]
