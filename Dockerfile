FROM	centos:7.9.2009
RUN	yum -y install unzip httpd
ADD	https://www.tooplate.com/download/2121_wave_cafe /var/www/html
WORKDIR	/var/www/html
RUN	unzip 2121_wave_cafe.zip && \
	cp -rf 2121_wave_cafe/* .
EXPOSE	80
CMD	["/usr/sbin/httpd", "-D", "FOREGROUND"]
