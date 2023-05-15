class UserMailer < ApplicationMailer

  default from: 'dreamrock@hotmail.fr'

  def welcome_email(user)
    @user = user

    @url = 'https://website.org/login'
    mail(to: @user.email, subject: "Salut à toi ! ")

  end
end
