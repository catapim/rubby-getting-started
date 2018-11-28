# Test AvispaTech Stage II

Esta es una aplicación de Rails sacada de ruby-getting-started.

Debes clonar esta aplicación y echarla a andar. Dentro están las instrucciones, son 3 partes. No debería tomarte más de 1.5 horas por ítem. Lee la documentación.

Mediremos aquí tu conocimiento de git, de ruby y de rails.

Te recomendamos que busques RVM.io

Hay una parte que requiere enviar un PDF 


## Running Locally

Make sure you have Ruby installed.  Also, install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) (formerly known as the Heroku Toolbelt).

```sh
$ git clone git@github.com:heroku/ruby-getting-started.git
$ cd ruby-getting-started
$ bundle install
$ bundle exec rake db:create db:migrate
$ heroku local
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```sh
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```

or

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


## Documentation

For more information about using Ruby on Heroku, see these Dev Center articles:

- [Ruby on Heroku](https://devcenter.heroku.com/categories/ruby)
