FROM openjdk

COPY . .

EXPOSE 8080

CMD ["java","-jar","/my.jar"]
