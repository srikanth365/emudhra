#!/usr/bin/groovy

pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

    stages {
	    
        stage("Build") {
            steps { buildApp() }
		}
	}
}


// steps
def buildApp() {
	dir ('' ) {
		def appImage = docker.build("emudhra/epragathi:${BUILD_NUMBER}")
	}
	
}









