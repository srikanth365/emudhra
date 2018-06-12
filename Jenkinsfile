#!/usr/bin/groovy

pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

    stages {

		stage("Test - Unit tests") {
			steps { runUnittests() }
		}

        stage("Build") {
            steps { buildApp() }
		}

        stage("Deploy - Dev") {
            steps { deploy('dev') }
		}
	}
}


// steps
def buildApp() {
	dir ('srikanth365/emudhra' ) {
		def appImage = docker.build("emudhra/epragathi:${BUILD_NUMBER}")
	}
}









