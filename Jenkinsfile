#!groovy

node {
	checkout scm
	stage("Building images") {
		make build clean
	}
}
