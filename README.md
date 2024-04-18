<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [HTTP-security](#http-security)
   * [Security.txt](#securitytxt)
   * [Hall-of-fame.txt](#hall-of-fametxt)
   * [Encryption.txt](#encryptiontxt)
   * [Policy.txt](#policytxt)
   * [Hiring.txt](#hiringtxt)
- [Vulnerabilities](#vulnerabilities)
   * [LOW](#low)
- [Usage](#usage)
   * [Docker-compose](#docker-compose)
   * [Building from scratch](#building-from-scratch)

<!-- TOC end -->


# HTTP-security

Docker Image for Apache HTTP Server that already includes the security files based on information from [securitytxt.org](https://securitytxt.org). It's based on [httpd](https://github.com/docker-library/httpd), so most of the credits do not go to me. I just added a basic security.txt to the .well-known folder. This file also links to a few files that are placed in the .well-known/security folder.

To implement the security standard, the following files are added
## Security.txt
This is the main entry point and is bound by some specs. The contents of the file will look like this:
 
	Contact: mail: please contact the webmaster
	Preferred-Languages: en
	Acknowledgments: /.well-known/security/hall-of-fame.txt
	Encryption: .well-known/security/encryption.txt
	Policy: /.well-known/security/policy.txt
	Hiring: /.well-known/security/hiring.txt

## Hall-of-fame.txt
The hall of fame text file only contains one sentence, basically stating nothing to see here:

	Since there has been no security reports yet, there is no one to mention on this page.
## Encryption.txt
The encryption text file only contains one sentence, basically stating to ignore encryption:

	You can contact me directly via mail, There is no need for additional encryption

## Policy.txt
The policy text file only contains one sentence, basically stating nothing to see here: 

	There is no real policy here, I just would appreciate it if you do not attack me and just notify me of the (potential) security leak, so I can fix it as quickly as possible.

## Hiring.txt
The hiring text file only contains one sentence, basically stating nothing to see here:

	I'm not hiring anyone, this is just a hobby project :)

# Vulnerabilities
All the security checks will be done by scout.docker.com. The last security check has been performed on 18-04-2024. During this test, there were one high and/or medium risks found. Those are not yet fixed because there is no fix available yet.

|Id|CVSS Risk |CVSS SCORE|Summary|
|--|--|--|--|
|[CVE-2023-52425⁠](https://scout.docker.com/vulnerabilities/id/CVE-2023-52425?s=debian&n=expat&ns=debian&t=deb&osn=debian&osv=12&vr=%3E%3D2.5.0-1&utm_source=desktop&utm_medium=ExternalLink)|High|7.5|Libexpat through 2.5.0 allows a denial of service (resource consumption) because many full reparsings are required in the case of a large token for which multiple buffer fills are needed.|
|[CVE-2024-2236](https://scout.docker.com/v/CVE-2024-2236?s=debian&n=libgcrypt20&ns=debian&t=deb&osn=debian&osv=12&vr=%3E%3D1.10.1-3&utm_source=desktop&utm_medium=ExternalLink)|Medium|5.9|A timing-based side-channel flaw was found in libgcrypt's RSA implementation.|
|[CVE-2024-28182](https://scout.docker.com/vulnerabilities/id/CVE-2024-28182/org/timotielens?s=debian&n=nghttp2&ns=debian&t=deb&osn=debian&osv=12&vr=%3E%3D1.52.0-1%2Bdeb12u1&utm_source=desktop&utm_medium=ExternalLink)|Medium|5.3|The nghttp2 library keeps reading the unbounded number of HTTP/2 CONTINUATION frames even after a stream is reset to keep HPACK context in sync.|

## LOW
In total, there are 19 low-risk issues that are not further addressed yet.

# Usage
The files that are deployed are in essence good enough so that they do not have to be changed. All the links are relative, and the contact information states that the webmaster email could be used. It's however advised to change them anyway so that you have the correct information and maybe even more information than the basics.

See [timotielens.nl/.well-known/security.txt](https://timotielens.nl/.well-known/security.txt) as an example.

## Docker-compose

See the example docker-compose file that can be used to host this container:

     version: '3.9'
		services:
			webserver:
			image: timotielens/http-security:latest
			ports:
				- '8080:80'
			volumes:
				- ./website:/usr/local/apache2/htdocs
				- ./security:/usr/local/apache2/htdocs/.well-known
This compose file will deploy the container that can be accessed via port 8080. There are two volume mappings. The first mapping can be used to access the folder that will be used to deploy the web server files to. The second folder is the one that should be used to modify the security files so that they are custom-made for your liking.

## Building from scratch
If you would like to build this container from scratch you can use the following steps:

1. Clone this repo locally and open a console in the root folder
2. Run the following command to build the container **docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -build-arg BUILD_NAME=timotielens/http-security  -build-arg BUILD_DESCRIPTION="Docker Image for Apache HTTP Server that already includes the security files" -t timotielens/http-security:2.4.59 .**
3.  You can now run the following command to have it running locally. **docker run -p 8080:80 timotielens/http-security:latest**
4. If you want to push it for some reason to hub.docker.com you first need to make sure that you're logged in, by running **Run  docker login  -u  timotielens**. Once you're logged in you can push the container by running **docker push timotielens/http-security:2.4.59**