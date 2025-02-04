# Use an official Jupyter Notebook image as the base
FROM jupyter/base-notebook:latest

# Set the working directory
WORKDIR /home/edd/work

# Install additional Python packages (if needed)
RUN pip install --no-cache-dir numpy pandas matplotlib

# Expose the port Jupyter Notebook runs on
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
