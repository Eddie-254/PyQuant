# Use a specific version of the Jupyter Notebook image as the base
FROM jupyter/base-notebook:sha256:<specific-digest>

# Set the working directory
WORKDIR /home/edd/work

# Update system packages and install additional Python packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir numpy==1.21.0 pandas==1.3.0 matplotlib==3.4.2

# Expose the port Jupyter Notebook runs on
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
