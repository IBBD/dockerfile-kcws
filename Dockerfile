#
# Dgraph Dockerfile
#

# Pull base image.
# 注意：在python3下有问题
FROM tensorflow/tensorflow:latest

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 建议：
# 代码挂载到：/var/www/kcws/
# 数据挂载到：/var/www/data/
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    #&& mkdir -p /var/www/

# 终端设置
# 执行php-fpm时，默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
