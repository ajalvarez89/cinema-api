# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '== Installing Seeds =='
# add rooms
puts '***** Creating Films'
Film.create(name: 'Joker', description: 'El Joker se centra en el icónico archienemigo en una historia original e independiente que no se vio antes en la pantalla grande. La exploración de Arthur Fleck, un hombre ignorado por la sociedad, no es solo un crudo estudio de carácter, sino también una historia de advertencia más amplia.', url_image: 'https://hackstore.net/wp-content/uploads/2019/11/Guason-Joker-Bluray-Audio-Latino-MEGA.jpg', start_date: '2019-12-01', end_date: '2019-12-31')

puts '***** Creating Films'
Reservation.create(name: "Alvaro Alvarez", email:"a.jalvarez@hotmail.com", document:"1140825821", phone:"3023515542", date:"2019-12-29", film_id: 1)