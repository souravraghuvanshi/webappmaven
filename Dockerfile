FROM openjdk
ADD target/sourav-spring-boot-0.1.0.war sourav-spring-boot-0.1.0.war
ENTRYPOINT ["java","-jar","/sourav-spring-boot-0.1.0.war"]
EXPOSE 9091
