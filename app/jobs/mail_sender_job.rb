# frozen_string_literal: true

class MailSenderJob < ApplicationJob
  queue_as :default

  def perform(other_user, follower)
    UserMailer.follow_user(other_user, follower).deliver
  end
end
