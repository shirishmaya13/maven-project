# Use a lightweight base image with Java 11
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory
WORKDIR /app

# Copy the JAR file from the target directory to the container
COPY /myapp/target/myapp-*.jar app.jar

# Expose the port on which your application will run (adjust as needed)
EXPOSE 8080

# Create a non-root user
RUN adduser --system --group --shell /bin/false myappuser

# Change the ownership of the application directory to the non-root user
RUN chown -R myappuser:myappuser /app

# Switch to the non-root user
USER myappuser

# Define the command to run your application
CMD ["java", "-jar", "app.jar"]
