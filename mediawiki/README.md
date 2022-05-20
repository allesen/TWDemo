# MediaWiki
Mediawiki deployment - Kubernetes

Please run below steps from client machine

# Steps to Automate the Mediawiki app deployment -

### 1. Clone the repository using git clone command
### 2. Install kubectl and helm on your local from below links -
####  a. https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
####  b. https://helm.sh/docs/intro/install/
### 3. Make sure that you have running kubernetes cluster and kubeconfig file is pointing to that cluster. You can check the nodes in the cluster using the command: kubectl get nodes.
### 4. Create namespace in kubernetes using the command: kubectl create namespace \<NAMESPACE\>
### 5. Set environment variables PASSWORD and ROOT_PASSWORD which are required for mariadb
### 6. Deploy the mediawiki using helm command:
####  helm install mediawiki mediawiki -n \<NAMESPACE\> --set db.password=$PASSWORD --set db.root_password=$ROOT_PASSWORD
### 7. Then check the running app.

  
### Delete the app using the command
#### helm delete mediawiki --purge 

  
--------------------------------------------------------------------------------  
Note: Dockerfile is kept in the repository for the reference

Reference: https://www.mediawiki.org/wiki/Manual:Running_MediaWiki_on_Red_Hat_Linux
