class Event < ApplicationRecord

  validates :start_date, presence: true, comparison: {greater_than: DateTime.now}
  validates :duration, presence: true
  validate :isMultipleOf5?
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, numericality: {in:1..1000}
  validates :location, presence: true

  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  def isMultipleOf5?
    return (duration%5==0 && duration>0) ? true : false
  end

end