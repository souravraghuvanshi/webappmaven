FROM openjdk
MAINTAINER sourav raghuvanshi 
ADD target/gs-spring-boot-0.1.0.war  gs-spring-boot-0.1.0.war
ENTRYPOINT ["java", "-jar", "/gs-spring-boot-0.1.0.war"]
EXPOSE 9091
