pipeline {
    agent any  // This will run the pipeline on any available agent

    stages {
        stage('Checkout') {
            steps {
                // Pull the Chef repository from GitHub
                git 'https://github.com/Ameeramahnoor/chef-repo.git'
            }
        }

        stage('Install Chef') {
            steps {
                // Make sure Chef Workstation is installed
                script {
                    if (!fileExists('/opt/chef/bin/chef-client')) {
                        echo "Chef Workstation is not installed. Installing Chef Workstation."
                        sh 'curl https://omnitruck.chef.io/install.sh | sudo bash'
                    }
                }
            }
        }

        stage('Run Chef Client') {
            steps {
                // Run the Chef client locally to apply the recipe
                script {
                    // Here we're using `chef-client` in local mode to run the recipe
                    sh 'chef-client --local-mode --runlist "recipe[my_cookbook]"'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Optional: Run InSpec tests (if applicable)
                    echo "Running InSpec tests (if any)"
                    sh 'inspec exec my_cookbook/tests'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Optional: Deploy your application if necessary
                    echo 'Deploying application...'
                }
            }
        }
    }

    post {
        always {
            // Clean up actions after the pipeline runs, such as notifying users or cleaning up resources
            echo 'Pipeline run complete.'
        }
    }
}
