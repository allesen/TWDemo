# TWDemo - Mediawiki Kubernetes Deployment. 

### Steps to deploy mediawiki application on AKS cluster. 

1. Clone the git repo to your machine 
   1. git clone https://github.com/allesen/TWDemo.git
2. Install kubectl and helm on your machine (Use below links for reference) - Please ignore if already exist
   1. https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
   2. https://helm.sh/docs/intro/install/
3. Authenticate with the kubernetes cluster
   1. az login
   2. az account set --subscription <Add subscription ID>
   3. az aks get-credentials --resource-group <Add name of resource group> --name <Add name of AKS>
4. Create a namespace in kubernetes
   1. kubectl create namespace <NAMESPACE>
5. Set environment variables for database
   1. PASSWORD 
   2. ROOT_PASSWORD 
6. Deploy mediawiki using helm command 
   1. helm install mediawiki <Path of helm chart> -n <NAMESPACE> --set db.password=$PASSWORD --set db.root_password=$ROOT_PASSWORD
7. Check the Pods - Two pods will be there - Application and Database
   1. kubectl get po -n <namespace>
8. Testing:
   1. kubectl port-forward pods/<Name of application pod> 8080:80
   2. Run "http://localhost:8080" in your browser, you will see the application frontend. 
