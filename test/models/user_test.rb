require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "1122", password_confirmation: "1122")
  end

  # test "should be valid" do
  #   assert @user.valid?
  # end

  # test "name should be present" do
  #   @user.name = " "
  #   assert_not @user.valid?
  # end

  # test "email validation should accept valid addresses" do
  #   valid_addresses = %w[user@example.com USER@foo.COM A_US-ERfoo.bar.org first.lastfoo.jp alice+bob@baz.cn]
  #   valid_addresses.each do |valid_address|
  #     @user.email = valid_address
  #     assert @user.valid?, "#{valid_address.inspect} should be valid"
  #   end
  # end

  test "email addresses should be saved as lowercase" do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password  should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
