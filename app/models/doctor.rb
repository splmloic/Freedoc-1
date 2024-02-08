class Doctor < ApplicationRecord
    belongs_to :city
    has_and_belongs_to_many :specialties
    has_many :appointments
    has_many :patients, through: :appointments
end
