FROM  registry.cn-shanghai.aliyuncs.com/xuepl/mycentos:2.0
# 指定维护者信息
MAINTAINER xuepl <xuepl@guoyasoft.com>

# 设置时区环境变量（ENV环境变量在Dockerfile中可以写多个）
# 这些指定的环境变量，后续可以被RUN指令使用，容器运行起来之后，也可以在容器中获取这些环境变量
ENV TZ "Asia/Shanghai"
ENV TERM xterm
# 项目名
ENV PROJECT_NAME test_allure/
# 设置sqlite3环境变量
ENV LD_LIBRARY_PATH /usr/local/sqlite/lib
# 设置默认工作目录为/data/项目名
WORKDIR /data/$PROJECT_NAME
COPY . /data/$PROJECT_NAME
RUN pip install -r requirements.txt
# Docker服务器开放的端口 供容器外部连接使用(在启动容器时做端口映射)
EXPOSE 5000
# 如果有多条ENTRYPOINT语句，那么只有最后一条生效
# ENTRYPOINT指的是container每次启动的时候需要执行的命令
CMD ["python", "manage.py", "runserver", "0.0.0.0:5000"]
