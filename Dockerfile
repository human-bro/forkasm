# Use the official Ubuntu image
FROM ubuntu:latest

# Set environment variables
ENV PUID=1000
ENV PGID=1000
ENV TZ=Etc/UTC
ENV SUBFOLDER=/
ENV TITLE="Ubuntu Container"

# Set the working directory
WORKDIR /app

# Update the package list and install desired packages
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose necessary ports (if needed)
EXPOSE 3000 3001

# Run a shell by default
CMD ["bash"]
