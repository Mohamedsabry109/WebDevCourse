# Setting Up Devpod CLI for DevContainer Usage

This comprehensive guide outlines the steps to seamlessly integrate Devpod CLI into your development workflow, allowing your team to efficiently utilize DevContainers. Follow these steps to ensure a smooth setup process.

## Prerequisites

1. **Install Git:**
   - Download and install Git from [git-scm.com](https://git-scm.com/).

2. **Install Docker:**
   - Download and install Docker from [docker.com](https://www.docker.com/get-started).

3. **Install Visual Studio Code or Another Supported IDE:**
   - Download and install Visual Studio Code or any other IDE that supports DevContainers.

4. **Install Devpod UI and CLI:**
   - Obtain Devpod CLI and UI by following the installation instructions provided in the official documentation from [devpod.sh](https://devpod.sh/).

5. **Create SSH Keys for GitHub:**
   - Generate SSH keys using `ssh-keygen` and follow GitHub's guide to [add SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) to your GitHub account.

## Setting Up DevContainers Locally

6. **Create a Sample DevContainer Configuration:**
   - In your project, create a `.devcontainer` folder and add a sample `devcontainer.json` file. Customize it based on your project's requirements. Each service should have its own `devcontainer.json` file. 

7. **Compose Docker Files:**
   - Create the necessary Docker or Docker Compose files in your project to define the development environment.

8. **Configure Devpod to Access Local Credentials:**
   - Modify the DevContainer configuration to mount local credentials into the container. This ensures seamless integration with your local environment.
   
   sample ``.devcontainer.json``
   ```
	"name": "DEV ENV NAME",
	"dockerComposeFile": "docker-compose.yml",
	"service": "SERVICE NAME INSIDE docker-compose.yml",
	"workspaceFolder": "/workspaces/${localWorkspaceFolderBasename}",
	"mounts": [
            "source=C:\\Users\\USER\\.ssh,target=/home/vscode/.ssh,type=bind,consistency=cached"
        ],
	"postStartCommand": ["/bin/bash", ".devcontainer/setup_ssh.sh"]
   ```
   sample `setup_ssh.ssh`
   ```
   #!/bin/bash

   eval $(ssh-agent)
   ssh-add /home/vscode/.ssh/id_rsa
   echo -e "\nHost github.com\n  IdentityFile ~/.ssh/id_rsa\n" >> /home/vscode/.ssh/config
   ```

9. **Utilize CLI for Container Operations:**
   - Leverage Devpod CLI to start and manage containers. Use commands such as `devpod up PATH_TO_PROJ-DIR --ide vscode` to create and launch DevContainers based on your configuration. This command will launch a new decontainer, and opens a new vscode window locally.

10. **Update .ssh/config permissions inside the container**
   You may need to update the user's permission to the mounted file inside the contianer, simply run `sudo chmod 600 /home/vscode/.ssh/config`.

11. 