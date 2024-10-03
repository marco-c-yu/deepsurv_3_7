# Use the Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables for configuration
ENV PYTHON_VERSION=3.7

# Set maintainer label
# LABEL maintainer="Your Name <your.email@example.com>"

# Update the package lists and install necessary packages
#RUN apt-get update && \
#    apt-get install -y python${PYTHON_VERSION} python3-pip && \
#    apt-get clean

RUN apt update
RUN apt-get install -y python3-pip

# Set the default command to run when the container starts
CMD ["python3"]

# Install necessary packages from URL
RUN pip install scikit-learn

# Install Jupyter Notebook
RUN pip install jupyter

# Set the default working directory
WORKDIR /DeepSurv

# Copy your application code to the container
COPY . /

# Install necessary packages from requirements.txt
RUN pip install -r requirements.txt

# Run Jupyter Notebook when the container launches
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip='0.0.0.0'","--port=8888", "--allow-root"]


# docker build -t <owner/image:version> -f Dockerfile .
#docker build -t py/deepsurv:3.7 -f Dockerfile .
# docker run -p <service-port>:<docker-container-port> -it <owner/image:version>
#docker run -p 8888:8888 -it py/deepsurv:3.7

# docker save -o <imagefile>.tar <owner/image:version>
# docker load -i <imagefile>.tar
