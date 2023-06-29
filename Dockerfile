# Build arguments
ARG AZ_VERSION
ARG TF_VERSION

FROM hashicorp/terraform:${TF_VERSION}
ARG AZ_VERSION
RUN apk update
RUN apk add bash py-pip
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make
RUN pip install --upgrade pip
RUN pip install azure-cli==${AZ_VERSION} && apk del --purge build 
