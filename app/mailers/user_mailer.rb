class UserMailer < ActionMailer::Base
  default from: "Person McHasaname <no-reply@yourappname.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @name = user.email.split("@").first
    @name = @name.titleize
    @greeting = "Hi"

    mail to: "#{@name} <user.email>"
  end
end
