class AttendanceMailer < ApplicationMailer

  default from: 'dreamrock@hotmail.fr'

  def new_event_mail(user)
    @user = user

    @url = 'https://website.org/login'
    mail(to: @user.email, subject: "Salut et bienvenue à toi dans ce nouvel évènement !")
  end

end