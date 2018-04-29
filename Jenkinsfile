pipeline {
	agent {
		label 'build_slave'
	}
	environment {
		RUN_REVIEW = 'false'
		RUN_BUILD = 'true'
		PUBLISH_TO_S3 = 'false'
		BUCKET_NAME = ''
		BUILD_FOUNDATION = 'true'
		CREATE_AMI = 'true'
		DEPLOY_APP = 'true'
    }

	stages {
		stage('Execute the SonarQube Static Code Analysis'){
			when { environment name: 'RUN_REVIEW', value: 'true' }
			steps {
				script {
				//SonarQubeScanner is the Sonar Scanner that is Configured under ManageJenkins-> Global Tools Configurations-> Sonar Scanner
				def scannerHome = tool 'SonarQubeScanner';
				withSonarQubeEnv('SonarQubeServer') {
					sh " ${scannerHome}/bin/sonar-scanner \
						-Dsonar.projectKey=demo.ccs.petclinic:scanner \
						-Dsonar.projectName=PetClinic_${BUILD_NUMBER}  \
						-Dsonar.projectVersion=1.0  \
						-Dsonar.host.url=http://sonarqube:9000    \
						-Dsonar.sources=.  \
						-Dsonar.sourceEncoding=UTF-8    \
						-Dsonar.language=java  \
						-Dsonar.java.binaries=.  \
						-Dsonar.ce.javaOpts='-Xmx1024m -Xms512m'"
					}
				}
			}
		}
		stage('Build Application') {
			when { environment name: 'RUN_BUILD', value: 'true' }
			steps {
				sh '''
					mvn clean package -Dmaven.test.skip=true
					cp target/spring-petclinic*.war CI_CD/Ansible/deploy/roles/tomcat/files/petclinic.war
				'''
			}
		}
		stage('Publish to S3') {
			when { environment name: 'PUBLISH_TO_S3', value: 'true' }
			steps {
				step([
					$class: 'S3BucketPublisher',
					entries: [[
						sourceFile: '**/spring-petclinic*.jar',
						bucket: "${env.BUCKET_NAME}/${env.BUILD_NUMBER}",
						selectedRegion: 'us-east-1',
						noUploadOnFailure: true,
						flatten: true,
						showDirectlyInBrowser: true,
						keepForever: true,
					]],
					profileName: '',
					dontWaitForConcurrentBuildCompletion: false,
				])
			}
		}
		stage('Build Foundation') {
			when { environment name: 'BUILD_FOUNDATION', value: 'true' }
			steps {
				script {
					sh """
						cd $WORKSPACE/CI_CD/Terraform/Foundation
						terraform init
						terraform apply -auto-approve
						sed -i 's/{VPC_ID}/'"\$(terraform output vpc_id)"'/g' $WORKSPACE/CI_CD/Packer/build_image.json
						sed -i 's/{SUBNET_ID}/'"\$(terraform output public1_subnet_id)"'/g' $WORKSPACE/CI_CD/Packer/build_image.json
						sed -i 's/{SG_ID}/'"\$(terraform output jumpserver_sg_id)"'/g' $WORKSPACE/CI_CD/Packer/build_image.json
					"""
				}
			}
		}
		stage('Create AMI using Packer') {
			when { environment name: 'CREATE_AMI', value: 'true' }
			steps {
				script {
					sh """
						cd $WORKSPACE/CI_CD/Packer
						export USER=jenkins
						packer build build_image.json | tee output.txt
						sed -i 's/{AMI_ID}/'"\$(tail -2 output.txt | head -2 | awk 'match(\$0, /ami-.*/) { print substr(\$0, RSTART, RLENGTH) }')"'/g' $WORKSPACE/CI_CD/Terraform/Deploy/terraform.tfvars
					"""
				}
			}
		}
		stage('Deploy Application') {
			when { environment name: 'DEPLOY_APP', value: 'true' }
			steps {
				script {
					sh """
						cd $WORKSPACE/CI_CD/Terraform/Deploy
						terraform init
						terraform apply -auto-approve
						echo "\$(terraform output app_url)"
					"""
				}
			}
		}
	}
/*	
	post {
		success {
			emailext (
				subject: "PetClinic Job SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
				body: """<p>SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
				<p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
				from: "",
				to: "",
				replyTo: ""
			)
		}
		failure {
			emailext (
				subject: "PetClinic Job FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
				body: """<p>FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
				<p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
				from: "",
				to: "",
				replyTo: ""
			)
		}
	} */
}	
