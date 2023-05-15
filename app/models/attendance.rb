class Attendance < ApplicationRecord
  after_create :welcome_send

  belongs_to :user
  belongs_to :event

  def welcome_send
    UserMailer.welcome_email(:user).deliver_now
  end

end