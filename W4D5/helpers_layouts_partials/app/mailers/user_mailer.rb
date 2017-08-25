class UserMailer < ApplicationMailer
  default from: 'notifications@nineninecats.com'
  # mails everybody@appacademy.io
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: "#{user.username}@gmail.com", subject: 'Welcome notification')
  end
end
