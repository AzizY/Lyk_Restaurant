class SocialProfile < ApplicationRecord
  belongs_to :place, optional: true
end
