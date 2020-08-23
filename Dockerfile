FROM registry.cn-shanghai.aliyuncs.com/xuepl/mycentos:2.0
COPY . /home/
WORKDIR /home
EXPOSE 8000
RUN pip install requests
CMD python test.py
