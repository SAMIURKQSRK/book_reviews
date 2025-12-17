class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :stars, presence: true, inclusion: { in: 1..5 }

  validates :content, length: { maximum: 1000 }

  def valid_for_average?
    !user.banned?
  end
end
