ARG AZ_VERSION
ARG TF_VERSION

FROM hashicorp/terraform:${TF_VERSION}
ARG AZ_VERSION
RUN apk --no-cache add bash==5.2.15-r5 py-pip==23.1.2-r0 && \
    apk --no-cache add --virtual=build==20230629.140450 gcc==12.2.1_git20220924-r10 libffi-dev==3.4.4-r2 musl-dev==1.2.4-r0 openssl-dev==3.1.1-r1 python3-dev==3.11.4-r0 make==4.4.1-r1

RUN pip install --no-cache-dir --upgrade pip==23.1.2
RUN pip install --no-cache-dir azure-cli==${AZ_VERSION}

RUN apk del --purge build && rm -rf /var/cache/apk/*
