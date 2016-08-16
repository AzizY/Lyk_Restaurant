class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :place
end
