pipeline{
    agent any
    stages{

//  I've used a public image for hello world nodejs as i don't have a container registry. Line number 6-18 is alternative approach if we have one ACR/ECR for experimentation.       
// 	    stage('Build Docker Image') {
//              steps {
		     
// 		 sh """
// 		      docker login ${DOCKER_REGISTRY_NAME} --username <username> --password-stdin
// 		      docker build \
// 		         -f Dockerfile \
// 			 -t "${DOCKER_REGISTRY_NAME}/<SOME NAME>:${env.GIT_COMMIT}" .
		
// 		      docker push ${DOCKER_IMAGE}:${env.GIT_COMMIT}
// 		    """
// 	        }
// 	   }
	    
	    
	    stage('Deploying ELK stack for monitoring the pods'){
            steps{
                
                sh """
                echo "Hello Condenast team, how are you doing everyone?"
		pwd
		ls -ltr
		kubectl get pods --kubeconfig=config
		kubectl apply -f elasticstack/hello-world.yml --kubeconfig=config
                kubectl apply -f elasticstack/elasticsearch.yml --kubeconfig=config
                kubectl apply -f elasticstack/kibana.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-configmap.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-role.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-role-binding.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-service-account.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-daemonset.yml --validate=false --kubeconfig=config
		echo "Check Kibana in browser"
                """
                
            }

        }
    }

    
}
