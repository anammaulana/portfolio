pipeline {
    agent any
 triggers {
        // Trigger build ketika ada perubahan pada repository
        githubPush()
    }
    environment {
        SSH_CREDENTIALS_ID = 'abd4393c-1330-465c-9578-ef920792da02'  // ID kredensial di Jenkins
        SERVER_USER = 'anammaulana'
        SERVER_HOST = '147.93.105.148'
        SERVER_PORT = '8080' // Gunakan port SSH, bukan port aplikasi
        DEPLOY_DIR = '/var/www/web-porto'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/anammaulana/portfolio.git'
            }
        }

        // stage('Install Dependencies') {
        //     steps {
        //         sh 'composer install --no-dev --optimize-autoloader'
        //     }
        // }

        
        stage('Deploy') {
            steps {
                script {
                    withCredentials([sshUserPrivateKey(credentialsId: SSH_CREDENTIALS_ID, keyFileVariable: 'SSH_KEY', usernameVariable: 'SSH_USER')]) {
                        sh '''
                            echo "Testing SSH connection..."
                            ssh -i $SSH_KEY -o StrictHostKeyChecking=no -p $SERVER_PORT $SSH_USER@$SERVER_HOST "echo 'SSH connection test successful'"

                            echo "Syncing files to server..."
                            rsync -avz -q --exclude=".git"  --no-perms  \
                            -e "ssh -i $SSH_KEY -p $SERVER_PORT -o StrictHostKeyChecking=no" . \
                            $SSH_USER@$SERVER_HOST:$DEPLOY_DIR
                        '''
                    }
                }
            }
        }
    }        
}

