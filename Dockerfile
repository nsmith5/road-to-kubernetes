FROM python:3.9
WORKDIR /app
COPY . .
RUN pip install pipenv
RUN pipenv install
EXPOSE 5000
CMD pipenv run python main.py
