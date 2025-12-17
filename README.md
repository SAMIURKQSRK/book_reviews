# Book Reviews Test

* Ruby version `3.1.1`
* Rails Version `7.2.3`

## Estructura del proyecto

```
app/
  models/
    book.rb
    user.rb
    review.rb
  services/
    books/
      calculate_reviews_average_service.rb
  presenters/
    books/
      book_presenter.rb
  controllers/
    books_controller.rb
  views/
    books/
      index.html.erb
      show.html.erb
spec/
  models/
  services/books
  presenters/books
  requests/
  factories
```

## Instalación

Clona el repositorio:

```bash
git clone https://github.com/tu_usuario/book_reviews.git
```

```
cd book_reviews
```

Instala dependencias:

```
bundle install
```

Crea la base de datos, ejecuta migraciones y carga datos iniciales:

```
rails db:create db:migrate db:seed
```

Ejecutar pruebas

```
bundle exec rspec
```

Ejecutar aplicacion

```
rails server
```