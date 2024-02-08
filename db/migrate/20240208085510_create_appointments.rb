class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.belongs_to :doctor
      t.belongs_to :patient
      t.references :city, foreign_key: true
      t.timestamps
    end
  end
end
