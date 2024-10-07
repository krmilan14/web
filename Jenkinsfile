pipeline {
    agent { label 'master' }

    environment {
        scannerHome = tool 'SonarQube-Scanner'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/krmilan14/web.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube-Local') {
                    sh "${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=my_project \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=${SONAR_TOKEN}"
                }
            }
        }
    }

    post {
        always {
            echo 'SonarQube analysis complete'
        }
    }
}
