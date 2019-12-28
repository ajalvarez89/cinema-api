# cinema-api

This is an API about cinema reservations

## Setup

Just run the bin setup:

```bash
  bin/setup
```
or

```bash
  bundle install
  yarn install --check-files
```

Now you should create db, run the migrates and seeds:

```bash
  rails db:create db:migrate db:seed
```

To run the app:

```bash
  rails server
```
## Endpoinds:💎

* GET Films:
```bash
   localhost:3000/v1/films
```
* GET Reservations:
```bash
   localhost:3000/v1/reservations
```

* POST Reservations:
```bash
   localhost:3000/v1/reservations
```
```bash
   HEADER:
 {
	"reservation": {
		"name":"Alvaro Alvarez",
		"film_id":1,
		"email":"a.jalvarez@hotmail.com",
		"document": "1140825821",
		"phone": "3023515542",
		"date": "2019-12-30"

	}
}
```

## Pending
- Install rspec
- Create tests
- config serializers