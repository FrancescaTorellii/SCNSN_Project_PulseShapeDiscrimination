FROM python:3.12-slim

USER root

WORKDIR /home/project

RUN useradd -m docker_user
RUN chown -R docker_user:docker_user /home/project

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=docker_user:docker_user . .

USER docker_user

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=8888", "--no-browser"]
