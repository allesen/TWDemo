FROM centos:7

RUN yum install -y centos-release-scl
RUN yum install -y wget httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xm rh-php73-php-intl 

ENV MEDIAWIKI_MAJOR_VERSION 1.37
ENV MEDIAWIKI_VERSION 1.37.2

RUN cd /opt/rh/httpd24/root/var/www/html \
    && wget --no-check-certificate https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR_VERSION}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz \
    && wget --no-check-certificate https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR_VERSION}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz.sig \
    && gpg --batch --keyserver keyserver.ubuntu.com --recv-keys \
       D7D6767D135A514BEB86E9BA75682B08E8A3FEC4 \
       441276E9CCD15F44F6D97D18C119E1A64D70938E \
       F7F780D82EBFB8A56556E7EE82403E59F9F8CD79 \
       1D98867E82982C8FE0ABC25F9B69B3109D3BB7B0 \
    && gpg --batch --verify mediawiki-${MEDIAWIKI_VERSION}.tar.gz.sig mediawiki-${MEDIAWIKI_VERSION}.tar.gz \
    && tar -zxf mediawiki-${MEDIAWIKI_VERSION}.tar.gz \
    && ln -s mediawiki-${MEDIAWIKI_VERSION} mediawiki \
    && rm -r mediawiki-${MEDIAWIKI_VERSION}.tar.gz mediawiki-${MEDIAWIKI_VERSION}.tar.gz.sig \
    && chown -R apache:apache mediawiki-${MEDIAWIKI_VERSION} && yum clean all

ENTRYPOINT ["/opt/rh/httpd24/root/usr/sbin/httpd-scl-wrapper", "-DFOREGROUND"]