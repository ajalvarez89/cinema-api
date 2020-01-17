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
* GET Films with filter:
```bash
   localhost:3000/v1/films/?start_date=2020-01-01&end_date=2020-12-31
```
* GET Reservations:
```bash
   localhost:3000/v1/reservations
```
* POST Reservations:
```bash
   localhost:3000/v1/reservations
```
* POST Reservations filter:
```bash
localhost:3000/v1/reservations/?start_date=2019-05-01&end_date=2019-12-31
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