class Tweet < ApplicationRecord

  belongs_to :user
  has_manuy :comments
end
