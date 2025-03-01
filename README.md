# jenkins_docker_pipeline_github_actions
jenkins docker cicd pipeline set up

## 🚀 TL;DR: 
- Install Required Tools: Install Docker, Jenkins, Git, and VS Code on your local machine.  
- Create a GitHub Repo: Store your Python application.  
- Write a Simple Python App: app.py (Basic app).  
- Write a Dockerfile: Defines how to containerize the app.  
- Write a Jenkinsfile: CI/CD pipeline for build, test, and deploy.  
- Run Jenkins in Docker: Start Jenkins and configure it.  
- Connect Jenkins to GitHub: Set up a webhook to trigger builds.  
- Deploy Locally: Build and run the container using Jenkins.  

---
## 🐢 More comprehensive breakdown: 

You need to install:
- Git
- Docker
- Jenkins
- host jenkins on the cloud or create a private tunnel from localhost to the internet so jenkins can communicate with your github repo
- a github repo to store all your code

### Start Jenkins

Jenkins uses java so need to install java jdk on your local machine and then also download and install jenkins properly. Figure that out and then once its installed, go to your `cmd` and run the following to  get jenkins running on your local depending on where you installed it and saved it on your computer (keep track of that).
    ```
    java -jar "C:\Program Files\Jenkins\jenkins.war"
    ```

    Once it is up and running you should be able to go to your `services` on your computer and see jenkins running:
   ![image](https://github.com/user-attachments/assets/201bc51f-d376-40d1-a284-a5338ac61f4d)

### Configure Jenkins Plugins
Go to Manage Jenkins → Manage Plugins → Install:  

- 🟢 Git Plugin  
- 🟢 GitHub Plugin  
- 🟢 Pipeline Plugin  
- 🟢 Docker Pipeline Plugin  

### Create a repo directory structure to use

jenkins_docker_pipeline/  
│── Dockerfile  
│── app.py  
│── requirements.txt  
│── Jenkinsfile  
│── README.md  

### Create Jenkins pipeline

Take a look at the `Jenkinsfile`. This file **clones this repo**, **builds the docker image**, and **runs the container**, each time it is triggered. Settings within the Jenkins dashboard needs to be configured to get this done.

### Create the Dockerfile

Take a look at the `Dockerfile`. 

This Dockerfile:

Uses Python 3.12  
Copies project files  
Installs dependencies  
Runs app.py on port 8080  

### Configure Jenkins and run it

Inside Jenkins:

1. **Create a New Job** → **Select Pipeline**
2. **Pipeline Definition** → **Use Pipeline Script from SCM**
3. **Set Repository URL** → https://github.com/thatwonguy/jenkins_docker_pipeline.git
4. **Set Branch** → `master` (make sure to select master or chooses the correct branch which requires more configurations)
5. **Save & Build Now**

### Automate the build with Github webhooks

This is where you either need to host jenkins on the cloud or use private tunneling to expose the port to on the internet some other way to allow for automatation to take place anytime a change is made to your `master` branch.

```
ngrok http 8080
```

Whatever url you expose needs to be configured in Github:

**Set GitHub Webhook**  
1. Go to GitHub Repo → Settings → Webhooks
2. Add Webhook:
    - Payload URL: `https://your-url-where-to-localhost-etc/github-webhook/` (make sure the forward slash and "/github-webook/" appears at the end EXACTLY or you will get a `302 error response`)  
    - Content Type: application/json
    - Trigger Events: Pushes
3. Save & Test → Ensure **200 OK** response.

## 🎯 Final Checklist  
✅ Jenkins Installed & Configured  
✅ Docker Installed & Running in Jenkins  
✅ Jenkins Pipeline with Docker  
✅ GitHub Webhook Triggers Auto Builds  
✅ ngrok Setup for Webhooks  

🎉 Your Jenkins + Docker CI/CD Pipeline is Ready and should be working now! 🚀
