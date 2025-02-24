# jenkins_docker_pipeline
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
1. Jenkins uses java so need to install java jdk on your local machine and then also download and install jenkins properly. Figure that out and then once its installed, go to your `cmd` and run the following to  get jenkins running on your local depending on where you installed it and saved it on your computer (keep track of that).
    ```
    java -jar "C:\Program Files\Jenkins\jenkins.war"
    ```

    Once it is up and running you should be able to go to your `services` on your computer and see jenkins running:
   ![image](https://github.com/user-attachments/assets/201bc51f-d376-40d1-a284-a5338ac61f4d)

2. 
