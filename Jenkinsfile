pipeline {
    agent {
        label 'kaliAgent'
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    git 'https://github.com/Harasisco/Dockerize_Python_djangoApp.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]){
                       sh "docker build -t ${env.dockerHubUser}/django-app:${version} ."
                    }
                }
            }
        }

        stage("Push to Docker Hub") {
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                    sh "docker login -u '${env.dockerHubUser}' -p '${env.dockerHubPass}'"
                    sh "docker push ${env.dockerHubUser}/django-app:${version}"
                }
            }
        }

        stage('Deploy to Remote host') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'ansible-target01', passwordVariable: "ansiblePass", usernameVariable: "ansibleUser")]){
                        sshagent(['ansible-target01']) {
                             withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]){
                                sh "sshpass -p '${env.ansiblePass}' ssh '${ansibleUser}'@192.168.100.177 \"docker run -d -p 8000:8000 --privileged --name django-app ${env.dockerHubUser}/django-app:${version}\""
                            }
                        }
                    }
                }
            }
        }
    }
}
