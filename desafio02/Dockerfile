FROM ubuntu
RUN ["apt", "-y", "update"]
RUN ["apt", "-y", "install", "python-pip", "python-dev", "build-essential"]
COPY requirements.txt /
COPY color.py /
COPY templates/hello.html /templates/
EXPOSE 9090
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "color.py"]
