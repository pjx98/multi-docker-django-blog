FROM python:3.8.3-alpine 

# set work directory
ENV HOME=/home/app
ENV APP_HOME=/home/app/web
RUN mkdir -p $APP_HOME
RUN mkdir -p $APP_HOME/staticfiles/blog
WORKDIR $APP_HOME

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# # install psycopg2 dependencies
# RUN apk update \
#     && apk add postgresql-dev gcc python3-dev musl-dev

# lint
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# COPY ./docker-entrypoint.sh /docker-entrypoint.sh
# RUN chmod +x /docker-entrypoint.sh
# ENTRYPOINT ["/docker-entrypoint.sh"]