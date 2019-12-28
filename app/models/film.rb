class Film < ApplicationRecord
    include AASM

    has_many :reservations
    validates :name, :description, :url_image, :start_date, :end_date, presence: true

    enum status: {
      active: 'active',
      inactive: 'inactive'
    }

    aasm column: "status", skip_validation_on_save: true do
      state :active, initial: true
      state :inactive

      event :disable do
        transitions from: :active, to: :inactive
      end
      event :enable do
        transitions from: :inactive, to: :active
      end
    end

    def self.actives
      where("films.status = 'active'")
    end

    def self.by_dates(start_date, end_date)
      where("(? >= films.start_date AND ? <= films.end_date) OR (? >= films.start_date AND ? <= films.end_date)", start_date, start_date, end_date, end_date)
    end

    def details
      {
        id: id,
        name: name,
        description: description,
        url_image: url_image,
        start_date: start_date,
        end_date: end_date,
        status: status
      }
    end
  end
