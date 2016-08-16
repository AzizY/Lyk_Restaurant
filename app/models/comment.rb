class Comment < ApplicationRecord
  belongs_to :place
  belongs_to :customer
end
