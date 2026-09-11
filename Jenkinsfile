
pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    bat 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:5.8.0.7211:sonar -Dsonar.projectKey=devops-java-cicd-project -Dsonar.projectName=devops-java-cicd-project'
                }
            }
        }

        stage('Verify') {
            steps {
                bat 'dir target'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                bat '''
                copy /Y target\\devops-java-app.war "C:\\Users\\lohit\\Downloads\\apache-tomcat-10.1.57-windows-x64\\apache-tomcat-10.1.57\\webapps\\"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t devops-java-app:1.0 .'
            }
        }
    }
}
