# SQL with Ruby

We have looked at writing SQL commands against a database using the `psql` tool.
While this is a great way to learn SQL and to write ad-hoc commands, it is
preferable to execute SQL commands directly from Ruby code. As an intermediate
step between writing SQL in psql and writing Ruby code that generates the SQL
commands we want to run, this exercise will introduce the concept of connecting
to a database with Ruby and executing SQL commands through that connection.

This exercise will use the same database schema as [https://github.com/gSchool/sql-query-exercise](https://github.com/gSchool/sql-query-exercise).
Before you begin this exercise, be sure that you have completed the first two
stories in that exercise.

## Setup

1. Fork and clone this repository
1. `cd` into the repository directory
1. `bundle install`

## Exercise

Your goal is to make all the tests in `spec/sql_exercise_spec.rb` pass. Run `rspec`
and you will see a single failing test. After you make that test pass, find the next
test in the test file and delete the line that says `skip`. Continue this process
until you have removed all the `skips` in the test file and all the tests pass.

## Database Configuration

When you run psql from the command line, it uses some default connection information
to connect to the database you want to run SQL queries against. Ruby doesn't
know about this default connection information, so you need to tell Ruby how to
connect to the database.

In this project, we are storing our database connection information in a separate
file from our Ruby code. This is a common pattern and makes it easy for our Ruby
code to connect to different databases (test, development, production) without
having to change.

The file in `config/database.yml` defines the connection options that our Ruby code
uses to connect to the database:

    development:
      adapter: postgresql
      encoding: unicode
      database: exercisedb
      username: gschool
      password:

We are telling Ruby that we want to connection to a Postgres database server, that
the name of the database RUby should connect to i `exercisedb`, the username Ruby
use to connect to the database is `gschool` (we created this Postgres user yesterday),
and the password Ruby should use to connect to the database is blank.
