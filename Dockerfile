FROM python:3.11.0b3-alpine3.15

RUN apk add wget alpine-sdk sudo

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN addgroup appuser abuild

RUN echo "%abuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/abuild

USER appuser
WORKDIR /home/appuser

RUN abuild-keygen -a -i -n

RUN wget https://git.alpinelinux.org/aports/plain/main/cython/APKBUILD
RUN wget https://git.alpinelinux.org/aports/plain/main/cython/cython-test-fix.patch
RUN wget https://github.com/cython/cython/commit/0f7bd0d1b159d085f321cc32a3f6ade24844e545.patch

# RUN abuild deps
# RUN abuild unpack
# RUN abuild prepare
# RUN abuild -r package

RUN abuild checksum && abuild -r
