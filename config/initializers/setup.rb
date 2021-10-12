# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'gmail.com',
  user_name: 'bilal.asghar@devsinc.com',
  password: 'alialiali112233',
  authentication: 'plain',
  enable_starttls_auto: true
}
