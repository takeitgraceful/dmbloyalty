class Card < ApplicationRecord
  has_one   :card_used
  has_one   :created_at
  has_one   :updated_at
end
