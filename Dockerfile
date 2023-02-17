FROM	centos:latest
RUN	sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
	sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \ 
	yum -y install unzip httpd
ADD	https://www.tooplate.com/zip-templates/2121_wave_cafe.zip /var/www/html
WORKDIR	/var/www/html
RUN	unzip 2121_wave_cafe.zip && \
	cp -rf 2121_wave_cafe/* .
EXPOSE	80
CMD	["/usr/sbin/httpd", "-D", "FOREGROUND"]
