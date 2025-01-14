class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :user_id, presence: true
  belongs_to :user
end
