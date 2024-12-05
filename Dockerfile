FROM python:3.10-slim

ENV JUPYTER_TOKEN=adam

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

RUN jupyter notebook --generate-config && \
  python -c "from notebook.auth import passwd; print(f'c.NotebookApp.password = \"{passwd(\"adam\")}\"')" >> /root/.jupyter/jupyter_notebook_config.py

