FROM rocker/r-base

MAINTAINER mike morris "mike.morris89@github.com"

# system libraries of general use
RUN apt-get update  -qq \
 && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends --allow-downgrades \
	apt-utils \
	default-jdk \
	libssl-dev \
	libxml2-dev \
	libcurl3-dev \
	libcurl4-openssl-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update -qq

# basic shiny functionality
RUN R -e "install.packages(c('dplyr' ,'shinydashboard' ,'shiny','rpivotTable','ggvis'),dep=T)"

# copy the app to the image
RUN mkdir /root/rpvt
COPY kml /root/rpvt

COPY Rprofile.site /usr/lib/R/etc/

RUN mkdir /srv/shiny-server
RUN mkdir /srv/shiny-server/rpvt
VOLUME /srv/shiny-server/rpvt

EXPOSE 3838

CMD ["R", "-e shiny::runApp('/root/rpvt')"]

