class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject

  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'Account activation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
    # @greeting = "Hi"
    # mail to: "to@example.org"
  end

  def follow_user(following, follower)
    @following = following
    @follower = follower
    # mail from: c_user.email
    mail to: @following.email, subject: 'follow user'
  end
end
