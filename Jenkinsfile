pipeline {
    agent any
    stages {
        stage('Install Puppet Agent') {
            steps {
                script {
                    sshagent(['ubuntu']) {
                        sh '''
                        ssh -o StrictHostKeyChecking=no ubuntu@98.84.170.85 "sudo apt-get update && sudo apt-get install -y puppet"
                        '''
                    }
                }
            }
        }
        stage('Install Docker with Ansible') {
            steps {
                script {
                    sshagent(['ubuntu']) {
                        sh '''
                        ansible-playbook -i test-server, install_docker.yml
                        '''
                    }
                }
            }
        }
        stage('Build and Deploy PHP Docker Container') {
            steps {
                script {
                    // Clone the PHP website repository
                    git 'https://github.com/ashishdevops29/projCert.git'
                    
                    // Build Docker image
                    sh 'docker build -t php-app .'
                    
                    // Run the Docker container on the test server
                    sh 'docker run -d --name php-app -p 80:80 php-app'
                }
            }
        }
    }
    post {
        failure {
            script {
                // Delete the running container if Job 3 fails
                sh 'docker rm -f php-app'
            }
        }
    }
}
