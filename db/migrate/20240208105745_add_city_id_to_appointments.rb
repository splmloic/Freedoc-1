class AddCityIdToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :city, null: false, foreign_key: true
  end
end
