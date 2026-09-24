# Jenkins LTS image used as the CI/CD server.
FROM jenkins/jenkins:lts-jdk17

# Temporarily use root only to copy the Docker CLI binary.
USER root

# Copy the Docker CLI directly from the official Docker image.
# This avoids installing packages inside the Jenkins image.
COPY --from=docker:29-cli /usr/local/bin/docker /usr/local/bin/docker

# Return to the standard non-root Jenkins user.
# Jenkins pipelines should not execute as root.
USER jenkins