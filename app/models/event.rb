class Event < ApplicationRecord

  validates :start_date, presence: true, comparison: {greater_than: DateTime.now}
  validates :duration, presence: true
  validate :multiple_of_5?
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, numericality: {in:1..1000}
  validates :location, presence: true

  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  def multiple_of_5?
    errors.add(:duration, 'Doit être un multiple de 5') unless duration % 5 == 0
  end

end