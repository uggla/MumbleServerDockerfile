MumbleServerDockerfile
======================
Dockerfile to build images for a mumble server.

Please report any issue or comment to github bug tracker :

https://github.com/uggla/MumbleServerDockerfile/issues

Prerequisites
-------------
- Use your regular user to build the image.
- Recent docker, image was successfully built on :

  - Fedora 22
  - Ubuntu 15.04 with some minor defects_.
    docker --version
    ::
       Docker version 1.5.0, build a8a31ef

- Install docker.
 Example :
 sudo apt-get install docker.io
 
 or
 
 sudo yum install docker-io
 
 sudo systemctl enable docker.service
 
 sudo systemctl start docker.service
 
- Add your user to the docker group.
 Example :
 usermod -G docker mumble
- Open port **64738** and **64738/udp** on your server firewall. Do not forget your firewall router, if you have one in between. 
 Example with firewalld :
 
 firewall-cmd --add-port 64738/tcp
 
Building instructions
---------------------
1. Clone the repo with git.
 git clone https://github.com/uggla/MumbleServerDockerfile.git
2. Change directory to the repository and run buildImage.sh.
 cd MumbleServerDockerfile
 
 ./buildImage.sh
3. Answer script questions.

   - Enter superuser password  --> Mumble SuperUser password.
   - Enter Server Name --> Server name to display at login.
   - Enter password  --> Mumble password to enter the lobby.

4. Time to have a coffee.


Running instructions
--------------------
- Run a container to start Mumble server.
 ./runMumble.sh

- Start an already existing container.
 docker start mumble
 
- Attach to the container console to show logs.
 docker attach mumble
 
 Note : ctrl p ctrl q to detach from container.

- Stop your server.
 docker stop mumble


Modifying container content
---------------------------
- You can edit the container to modify options.
 sudo docker run -u root --entrypoint="/bin/bash" -ti --name "mumble" mumble
 
 
Ubuntu 15.04 minor defects
--------------------------
.. _defects:

- Warnings are displayed about label.
 # Skipping unknown instruction LABEL
