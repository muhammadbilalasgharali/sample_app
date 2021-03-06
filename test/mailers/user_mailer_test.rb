# frozen_string_literal: true

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'account_activation' do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal 'Account activation', mail.subject
    assert_equal [user.email], mail.toassert_equal
    assert_match
    assert_match
    assert_match
  end

  test 'password_reset' do
    mail = UserMailer.password_reset
    assert_equal 'Password reset', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
