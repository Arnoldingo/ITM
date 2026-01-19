pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git(
                    url: 'https://github.com/Arnoldingo/ITM.git',
                    branch: 'main',
                    credentialsId: 'github-credentials'
                )
            }
        }

        stage('Restore dependencies') {
            steps {
                dir('frontend/EasyDevOpsApp') {
                    bat 'dotnet restore'
                }
            }
        }

        stage('Build frontend') {
            steps {
                dir('frontend/EasyDevOpsApp') {
                    bat 'dotnet build --configuration Release'
                }
            }
        }

        stage('Test frontend') {
            steps {
                dir('frontend/EasyDevOpsApp') {
                    bat 'dotnet test'
                }
            }
        }

        stage('Security test') {
            steps {
                dir('frontend/EasyDevOpsApp') {
                    bat 'dotnet list package --vulnerable'
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
