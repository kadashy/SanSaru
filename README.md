# San-Saru AoC CL 2019

[![Maintainability](https://api.codeclimate.com/v1/badges/e7b16647550a48e4c9a3/maintainability)](https://codeclimate.com/github/yamitcar/SanSaru/maintainability) <a href="https://codeclimate.com/github/yamitcar/SanSaru/test_coverage"><img src="https://api.codeclimate.com/v1/badges/e7b16647550a48e4c9a3/test_coverage" /></a>

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

parar configurar el ambiente de desarrollo instalar> 
    
    Postgres
    ruby
    rails
    
    dentro de la raiz del proyecto
    
    > gem install bundler
    
    > bundle install
    
    configurar los parametros del db en:
        config/database.yml
    
    > rails db:create
    
    
    para iniciar la app
    
    rails s
    foreman start
    

Next, migrate the database:

```
$ rails db:migrate
```

on heroku:

    heroku run rails db:migrate
    
If the test suite passes, you'll be ready to run the app in a local server:

```
$ foreman start
```
    

    
Para desplegar en Heroku:

    - Hacer push
    - agregar cambios en la db:
        heroku run rails db:migrate
    - correr semillas y crear usuarios (verificar el usuario administrador)
        heroku run rails db:seed 
        o
        heroku run rails console y ejecutar cambios desde alli.
    -agregar variables de entorno:
        mails y demas
        heroku config:add MAIL_PASSWORD=password12345 MAIL_USERNAME=support@yoururl.com MAIL_DOMAIN=gmail.com SMTP_ADDR=smtp.gmail.com
        
to drop heroku db:
            
    heroku pg:reset DATABASE_URL
    
Las invitaciones solo se podran activar si desde la interfaz administrativa se crean:

    las 3 invitaciones iniciales
    se activa el perido de invitaciones en las configuraciones. 
