FROM maven:3.9.6-eclipse-temurin-17

# Установка Chrome
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    gnupg

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" \
    > /etc/apt/sources.list.d/google.list

RUN apt-get update && apt-get install -y google-chrome-stable

WORKDIR /app

COPY . .

RUN mvn dependency:resolve

CMD ["mvn", "test"]



#FROM maven:3.9.6-eclipse-temurin-17

#WORKDIR /app

#COPY . .

#RUN mvn dependency:resolve

#CMD ["mvn", "test"]
