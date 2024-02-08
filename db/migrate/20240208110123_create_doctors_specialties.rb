class CreateDoctorsSpecialties < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors_specialties do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
