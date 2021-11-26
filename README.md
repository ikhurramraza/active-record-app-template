# Active Record app without Rails

App that uses Active Record to store data. But it's not a Rails app.

## Getting started

1. Create a repo on GitHub using this template.
2. Replace the `app_name` with your app name.
3. Replace the database config with your own.

## Usage

To create a new migration, run:

```
rake generate:migration MyMigrationName
```

To run the migrations, run:

```
rake db:migrate
```

To rollback migrations, run:

```
rake db:rollback
STEP=2 rake db:rollback
```
