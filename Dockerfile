FROM python:3.11.0b3-alpine3.15

RUN apk add wget alpine-sdk sudo

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN addgroup appuser abuild

RUN echo "%abuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/abuild

USER appuser
WORKDIR /home/appuser

RUN abuild-keygen -a -i -n

RUN wget https://git.alpinelinux.org/aports/plain/main/cython/cython-test-fix.patch
ADD longintrepr.patch
ADD APKBUILD
RUN git apply longintrepr.patch

# RUN abuild deps
# RUN abuild unpack
# RUN abuild prepare
# RUN abuild -r package

RUN abuild checksum && abuild -r
