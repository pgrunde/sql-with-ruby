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
1. `bundle install`
1. Create a new Pivotal Tracker account and import the stories in `stories.csv`
