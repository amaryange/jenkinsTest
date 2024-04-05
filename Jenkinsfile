pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'cicd-myapp'
        NOTIFICATION_EMAIL = 'melessangekevin@gmail.com'
    }

    tools {
        maven 'maven_3_9_5'
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh "docker compose -f docker-compose.yml up -d"
                }
            }
        }
    }

    post {
        always {
            // Suppression du répertoire de travail
            deleteDir()
        }
        success {
            // Envoi d'un e-mail de notification en cas de succès
            emailext body: 'Le déploiement est terminé.', subject: 'Notification de déploiement réussi', to: NOTIFICATION_EMAIL
        }
        failure {
            // Envoi d'un e-mail de notification en cas d'échec
            emailext body: 'Le déploiement a échoué.', subject: 'Notification de déploiement échoué', to: NOTIFICATION_EMAIL
        }
    }
}
