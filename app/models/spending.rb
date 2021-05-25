class Spending < ApplicationRecord
  with_options presence: true do
    validates :price, inclusion: { in: 1..100000000 }, format: {with: /\A[0-9]+\z/}, numericality: true 
    validates :category
    validates :memo
    validates :date
    validates :image
  end

  def start_time
    self.date
  end

  belongs_to :user
end
