FROM httpd:2.4.58

#############################
### ENVIRONMENT VARIABLES ###
#############################
# Name of the base image that will be used
ENV BASE_NAME="httpd"
# Version of the base image that will be used
ENV BASE_VERSION="latest"
# Name and version of the base image that will be used
ENV Base=httpd:latest

###################################
### ARGUMENTS  - opencontainers ###
###################################
# Date and time on which the image was built, conforming to RFC 3339
ARG BUILD_DATE		    
# Human-readable title of the image
ARG BUILD_NAME
# Human-readable description of the image	
ARG BUILD_DESCRIPTION
# version of the packaged software. FALLBACK is Build Date
ARG BUILD_VERSION=$BUILD_DATE
# Name of the author that created the image
ARG AUTHOR_NAME
# Vendor (organization or individual) that created the image
ARG AUTHOR_VENDOR
# E-mail of the Author
ARG AUTHOR_EMAIL
# URL to find more information on the image
ARG URL_GENERAL
# URL to get documentation on the image
ARG URL_DOCUMENTATION
# URL to get source code for building the image		    
ARG URL_SOURCE
# Identifier of the GIT Commit that is used to build this container			        
ARG GIT_COMMIT_ID
# License(s) under which contained software is distributed
ARG LICENSES="MIT"

# Add labels according to the opencontainers spec. https://github.com/opencontainers/image-spec/blob/main/annotations.md
###
# Human-readable title of the image (string)
LABEL org.opencontainers.image.title="$BUILD_NAME"
# Human-readable description of the software packaged in the image (string)
LABEL org.opencontainers.image.description="$BUILD_DESCRIPTION"
# Date and time on which the image was built, conforming to RFC 3339.
LABEL org.opencontainers.image.created="$BUILD_DATE"
# contact details of the people or organization responsible for the image (freeform string)
LABEL org.opencontainers.image.authors="$AUTHOR_NAME $AUTHOR_EMAIL"
# URL to find more information on the image (string)
LABEL org.opencontainers.image.url="$URL_GENERAL"
# URL to get documentation on the image (string)
LABEL org.opencontainers.image.documentation="$URL_DOCUMENTATION"
# URL to get source code for building the image (string)
LABEL org.opencontainers.image.source="$URL_SOURCE"
# version of the packaged software
LABEL org.opencontainers.image.version="$BUILD_VERSION"
# Source control revision identifier for the packaged software
LABEL org.opencontainers.image.revision="$GIT_COMMIT_ID" 			
# Name of the distributing entity, organization or individual
LABEL org.opencontainers.image.vendor="$AUTHOR_VENDOR"
# License(s) under which contained software is distributed as an SPDX License Expression
LABEL org.opencontainers.image.licenses="$LICENSES"
# Image reference of the image this image is based on (string)
LABEL org.opencontainers.image.base.name="$Base"

# Upgrade packages
RUN apt-get update; apt-get upgrade -y

# Set the security files
COPY src/security.txt /usr/local/apache2/htdocs/.well-known/security.txt
COPY src/hall-of-fame.txt /usr/local/apache2/htdocs/.well-known/security/hall-of-fame.txt
COPY src/hiring.txt /usr/local/apache2/htdocs/.well-known/security/hiring.txt
COPY src/policy.txt /usr/local/apache2/htdocs/.well-known/security/policy.txt
COPY src/encryption.txt /usr/local/apache2/htdocs/.well-known/security/encryption.txt