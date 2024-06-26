FROM maven:3.8.3-openjdk-17
ENV JAVA_HOME /usr/java/openjdk-17
RUN export JAVA_HOME

RUN mkdir -p /app
WORKDIR /app
COPY pom.xml /app
COPY application.properties /app
COPY src /app/src

RUN mvn -f pom.xml clean package

RUN cp target/*.jar app.jar

EXPOSE 8746

ENTRYPOINT ["java","-jar","app.jar","--spring.config.location=application.properties"]