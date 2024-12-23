pipeline {
    agent any
    stages {
        stage('Install Puppet Agent') {
            steps {
                script {
                      sh '''
                     sudo apt-get update && sudo apt-get install -y puppet
                        '''
                    }
                }
            }
        
        stage('Install Docker with Ansible') {
            steps {
                script {
                     sh '''
                        ssh  ubuntu@18.212.99.55 "ansible-playbook /home/ubuntu/projCert/install_docker.yml"
                        '''
                    }
                }
            }
        
        
        stage('Build and Deploy PHP Docker Container') {
            steps {
                script {
                    // Clone the PHP website repository
                    git 'https://github.com/ashishdevops29/projCert.git'
                    
                    // Build Docker image
                    sh 'su docker build -t php-app .'
                    
                    // Run the Docker container on the test server
                    sh 'su docker run -d --name php-app -p 80:80 php-app'
                }
            }
        }
    }
    post {
        failure {
            script {
                // Delete the running container if Job 3 fails
                sh 'su docker rm -f php-app'
            }
        }
    }
}
