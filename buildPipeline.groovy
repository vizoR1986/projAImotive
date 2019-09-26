// Jenkinsfile

pipeline {

  node any

  stages {
      stage ('build docker image') {
          sh "docker build ./ -t yaml-cpp:0.1"
      }

      stage ('execute the docker image') {
          sh "docker run -itd --memory=1024m --cpus=1 yaml-cpp:0.1"
      }

      stage ('get the archived binaries') {
          sh './gatherOutput.sh'
      }

      stage ('Upload archive') {
          archiveArtifacts artifacts: 'buildOutput/*.tar.gz'
      }
  }
}
