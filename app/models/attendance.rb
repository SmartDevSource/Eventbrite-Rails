class Attendance < ApplicationRecord
  after_create :welcome_new_event_mail

  belongs_to :attendee, class_name: "User"
  belongs_to :event

  def welcome_new_event_mail
    AttendanceMailer.new_event_mail(User.find_by(id: self.attendee_id)).deliver_now
  end

end