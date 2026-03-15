## CI Status
[![Build Status](http://localhost:8080/job/qa-automation-ci-cd/badge/icon)](http://localhost:8080/job/qa-automation-ci-cd/)

# qa-automation-ci-cd

# QA Automation CI/CD Pipeline

This project demonstrates a complete **QA Automation CI/CD pipeline** built with modern tools and best practices.

The framework runs automated UI tests inside Docker containers and integrates with Jenkins for continuous integration and reporting.

---

## 🚀 Tech Stack

* Java
* Selenium WebDriver
* TestNG
* Maven
* Docker
* Jenkins
* Allure Report
* Telegram Notifications
* GitHub Webhooks

---

## ⚙️ CI/CD Pipeline Architecture

The pipeline is triggered automatically on every push to GitHub.

Pipeline flow:

GitHub push
↓
Jenkins pipeline triggered
↓
Docker image build
↓
Parallel test execution (Chrome + Firefox)
↓
Allure report generation
↓
Telegram notification (success / failure)

---

## 🐳 Dockerized Test Execution

Tests run inside Docker containers to ensure a clean and reproducible environment.

Key features:

* Chrome browser installed inside container
* Maven dependencies cached for faster builds
* Test results exported for reporting

---

## 📊 Test Reporting

Test results are visualized using **Allure Report**.

The report includes:

* Test execution history
* Pass / fail statistics
* Execution timeline
* Detailed failure information

---

## 🔔 Notifications

Pipeline status notifications are sent automatically via Telegram.

Notifications include:

* Successful pipeline execution
* Failed test runs

This allows quick monitoring of CI results.

---

## ⚡ Performance Optimization

To speed up builds the project uses:

* Docker layer caching
* Maven dependency caching
* Parallel test execution

These optimizations significantly reduce pipeline execution time.

---

## 📂 Project Structure

src/test/java
  tests and test classes

src/test/resources
  test resources

Dockerfile
  Docker environment for running tests

Jenkinsfile
  CI/CD pipeline configuration

pom.xml
  Maven project configuration

---

## ▶️ How to Run Locally

Run tests with Maven:

mvn clean test

Build Docker image:

docker build -t qa-automation .

Run tests inside container:

docker run qa-automation

---

## 📌 Continuous Integration

The project uses Jenkins to automatically:

* build the Docker image
* execute tests
* generate reports
* send notifications

This setup demonstrates a real-world QA automation workflow.

---

## 👨‍💻 Author

Oleg Kapustin
