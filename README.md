# httpd-security
Docker Image for Apache HTTP Server that already includes files based on information from [securitytxt.org](https://securitytxt.org). It's based on [httpd](https://github.com/docker-library/httpd), so most of the credits do not go to me. I just added a basic security.txt to the .well-known folder. This files also links to a few files that are placed in the .well-known/security folder.

# Usage

The files that are deployed are in essence good enough so that they do not have to be changed. All the links are relative, and the contact information states that the webmaster email could be used. However, it's advised to change them anyway so that you have the correct information and maybe even more information then the basics. 

See [timotielens.nl](https://timotielens.nl/.well-known/security.txt) for an example

## Docker-compose
See the example docker-compose file that cna be used to host this container

       version: '3.9'
       services:
         webserver:
           image: httpd:latest
           ports:
             - '8080:80'
           volumes:
             - ./website:/usr/local/apache2/htdocs
             - ./security:/usr/local/apache2/htdocs/.well-known

This compose file will created a security folder which holds the following files:

### security.txt

This is the main entry point and is bound by some specs. The contents of the file will look like this:

       Contact: mail: please contact the webmaster
       Preferred-Languages: en
       Acknowledgments: /.well-known/security/hall-of-fame.txt
       Encryption: .well-known/security/encryption.txt
       Policy: /.well-known/security/policy.txt
       Hiring: /.well-known/security/hiring.txt

### hall-of-fame.txt
The hall of fame text file only contains one sentence, basically stating nothing to see here:

       Since there has been no security reports yet, there is no one to mention on this page.  

### encryption.txt
The encryption text file only contains one sentence, basically stating to ignore encryption:

       You can contact me directly via mail, There is no need for additional encryption
### policy.txt
The policy text file only contains one sentence, basically stating nothing to see here:

       There is no real policy here, I just would appreciate it if you do not attack me and just notify me of the (potential) security leak, so I can fix it as quickly as possible. 

### hiring.txt
The hiring text file only contains one sentence, basically stating nothing to see here:

       I'm not hiring anyone, this is just a hobby project :)





docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t myimage:latest .
docker run -p 5698:80 myimage:latest