class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  has_many :events, through: :attendances
  has_many :events, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendances, foreign_key: 'attendee_id', class_name: "Attendance"

  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end