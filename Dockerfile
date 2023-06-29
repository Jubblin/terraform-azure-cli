ARG AZ_VERSION
  # checkov:skip=CKV_DOCKER_2: ADD REASON
ARG TF_VERSION

FROM hashicorp/terraform:${TF_VERSION}
ARG AZ_VERSION
RUN apk update && \
    apk add bash py-pip && \
    apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make
RUN pip install --upgrade pip
RUN pip install azure-cli==${AZ_VERSION} && apk del --purge build
