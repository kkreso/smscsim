FROM maven:3.6.2-jdk-8

COPY . /root/smscsim/
WORKDIR /root/smscsim
RUN ["mvn", "-e", "install", "assembly:assembly"]
RUN ["unzip", "target/smscsim-1.0.0-dist.zip", "-d", "smscsim"]
CMD ["java", "-Xms32m", "-Xmx1024m", "-jar", "smscsim/smscsim-1.0.0/smscsim.jar", "-ll", "INFO", "-p", "2775"]
