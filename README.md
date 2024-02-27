           _____ __      _______  
    o O O |_   _|\ \    / /_   _| 
   o        | |   \ \/\/ /  | |   
  TS__[O]  _|_|_   \_/\_/  _|_|_  
 {======|_|"""""|_|"""""|_|"""""| 
./o--000'"`-0-0-'"`-0-0-'"`-0-0-' 

# httpd-security
Docker Image for Apache HTTP Server that already includes files based on securitytxt.org

This docker is based on [httpd](https://github.com/docker-library/httpd), so most of the credits do not go to me. 


docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t myimage:latest .
docker run -p 5698:80 myimage:latest