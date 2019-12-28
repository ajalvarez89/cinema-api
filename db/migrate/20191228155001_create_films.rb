class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :url_image, null: false, default: ''
      t.date :start_date, null: false, default: ''
      t.date :end_date, null: false, default: ''
      t.string :status, null: false, default: ''

      t.timestamps
    end
  end
end
