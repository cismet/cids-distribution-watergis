FROM reg.cismet.de/abstract/cids-distribution:7.0-debian

ARG IMAGE_VERSION=unknown

ENV CIDS_ACCOUNT_EXTENSION Watergis
ENV GIT_DISTRIBUTION_PROJECT=cismet/cids-distribution-watergis
ENV UPDATE_SNAPSHOTS -U -Dmaven.clean.failOnError=false -Dmaven.test.skip=true

ENV TZ=Europe/Berlin
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8

# needed for the report generation stuff to work in a headless environment
RUN apt-get update && \
   apt-get install -y xvfb libxrender1 libxtst6 && \
   apt-get clean

LABEL maintainer="Jean-Michel Ruiz <jean.ruiz@cismet.de>" \
   de.cismet.cids.distribution.name="${GIT_DISTRIBUTION_PROJECT}" \
   de.cismet.cids.distribution.description="cids WRRL-DB-MV Distribution Runtime Image" \
   de.cismet.cids.distribution.version="${IMAGE_VERSION}" 

