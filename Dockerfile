# Build arguments
ARG AZURE_CLI_VERSION
ARG TERRAFORM_VERSION

FROM hashicorp/terraform:${TERRAFORM_VERSION}

RUN apk update
RUN apk add bash py-pip
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make
RUN pip install azure-cli==${AZURE_CLI_VERSION} && apk del --purge build 
