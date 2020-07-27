FROM python:3.7-stretch

WORKDIR /home/app

# install requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

# additional custom setup
COPY setup.py setup.py
RUN python setup.py

# copy model
COPY model model

# copy code
COPY hw3 hw3
ENV PYTHONPATH hw3

# standard cmd
CMD [ "python", "hw3/app.py" ]
