class Reservation < ApplicationRecord

    belongs_to :film
    validates :name, :email, :document, :phone, :date, presence: true
    validate :limit_reservations_by_film?

    enum status: {
      active: 'active',
      inactive: 'inactive'
    }

    def limit_reservations_by_film?
      count_reservation_film = Reservation.where(film_id: self.film_id, date: date).count
    end

    def self.actives
      where("reservations.status = 'active'")
    end

    def self.by_dates(start_date, end_date)
      where("reservations.date >= ? AND reservations.date <= ? ", start_date, end_date)
    end

    def details
      {
        id: id,
        film: film.name,
        name: name,
        email: email,
        document: document,
        phone: phone,
        date: date,
        status: status
      }
    end
  end
