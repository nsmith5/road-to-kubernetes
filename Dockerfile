FROM python:3.9
WORKDIR /app
COPY . .
RUN pip install pipenv
RUN pipenv install
ENV PIPENV_VENV_IN_PROJECT=1
CMD pipenv run python main.py
