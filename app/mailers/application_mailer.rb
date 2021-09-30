# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'bilal.asghar@devsinc.com'
  layout 'mailer'
end
