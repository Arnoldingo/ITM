pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Arnoldingo/ITM.git'
            }
        }

        stage('Restore dependencies') {
            steps {
                dir('frontend/EasyDevOpsApp') {
                    sh 'dotnet restore'
                }
            }
        }

        stage('Build frontend') {
            steps {
                dir('frontend/EasyDevOpsApp') {
                    sh 'dotnet build --configuration Release'
                }
            }
        }

        stage('Test frontend') {
            steps {
                dir('frontend/EasyDevOpsApp') {
                    sh 'dotnet test'
                }
            }
        }

        stage('Security test') {
            steps {
                dir('frontend/EasyDevOpsApp') {
                    sh 'dotnet list package --vulnerable'
                }
            }
        }
    }

    post {
        failure {
            echo 'Build of security test failed'
        }
        success {
            echo 'Frontend build & security test successful'
        }
    }
}
