FROM debian:unstable

RUN echo 'Acquire::http { Proxy "http://192.168.1.100:3142"; };' > /etc/apt/apt.conf.d/proxy
RUN apt-get update
RUN apt-get install -y puppet
RUN puppet module install puppetlabs/tomcat
RUN apt-get install -y openjdk-7-jre-headless
RUN apt-get install -y curl
ADD helloworld.pp /tmp/helloworld.pp

EXPOSE 8081

CMD bash -l

