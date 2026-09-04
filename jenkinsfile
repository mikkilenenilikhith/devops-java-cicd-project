pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven3.9.9'
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

        stage('Verify') {
            steps {
                bat 'dir target'
            }
        }
    }
}