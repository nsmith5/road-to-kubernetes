FROM python:3.9
WORKDIR /app
COPY . .
RUN pip install pipenv
RUN pipenv lock --requirements > requirements.txt
RUN pip install -r requirements.txt
CMD python main.py
