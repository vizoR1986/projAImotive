// Jenkinsfile

pipeline {

  agent master

  stages {
      stage ('build docker image') {
          steps {
            sh 'docker build ./ -t yaml-cpp:0.1'
        }
      }

      stage ('execute the docker image') {
          steps {
            sh 'docker run -itd --memory=1024m --cpus=1 yaml-cpp:0.1'
        }
      }

      stage ('get the archived binaries') {
          strps{
            sh './gatherOutput.sh'
          }
      }

      stage ('Upload archive') {
          steps {
            archiveArtifacts artifacts: 'buildOutput/*.tar.gz'
      }
    }
  }
}
