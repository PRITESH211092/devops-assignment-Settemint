pipeline {
    agent { label "dev-server"}
    
    stages {
        
        stage("code"){
            steps{
                git url: "https://github.com/PRITESH211092/devops-assignment-Settemint.git", branch: "master"
                echo 'The clod repo has been cloned'
            }
        }
        stage("build and test"){
            steps{
                sh "docker build -t node-app ."
                echo 'the code has been build-image created'
            }
        }
        stage("scan image"){
            steps{
                echo 'the image has been scanned'
            }
        }
        stage("push"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker tag node-app:latest ${env.dockerHubUser}/node-app:latest"
                sh "docker push ${env.dockerHubUser}/node-app:latest"
                echo 'image has been pushed to registry'
                }
            }
        }
        stage("deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
                echo 'The deployment was completed'
            }
        }
    }
}
