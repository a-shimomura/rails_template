# rails_template

## Usage

1. Fork this repository
2. rails new
```
docker-compose run web rails new . -s -d mysql --api
```
3. docker build
```
docker-compose build
docker-compose up -d
```
4. edit database config
```
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: <%= ENV.fetch("MYSQL_DB") { '' } %>
  username: <%= ENV.fetch("MYSQL_USER") { '' } %>
  password: <%= ENV.fetch("MYSQL_ROOT_PASSWORD") { '' } %>
  host: db
```
5. create database
```
docker-compose exec web rails db:create
```
