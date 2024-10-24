# base image
FROM ubuntu:18.04

# 아파치2 패키지 설치
RUN apt-get update && apt-get -y install apache2

# 웹 기본 페이지를 생성
RUN echo "Docker Container Application." > /var/www/html/index.html

# 필요한 작업경로를 생성
RUN mkdir /webapp

#
RUN echo "./etc/apache2/envvars" > /webapp/run_http.sh && \
echo 'mkdir -p /var/run/apache2' >> /webapp/run_http.sh && \
echo 'mkdir -p /var/lock/apache2' >> /webapp/run_http.sh && \
echo '/usr/sbin/apache2 -D FOREGROUND' >> /webapp/run_http.sh && \
chmod 744 /webapp/run_http.sh

# open 80 port
EXPOSE 80

# RUN 명령어로 작성된 셸 스크립트를 컨테이너가 동작할 때 실행
CMD /webapp/run_http.sh
