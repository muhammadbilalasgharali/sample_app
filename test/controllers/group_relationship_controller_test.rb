# frozen_string_literal: true

require 'test_helper'

class GroupRelationshipControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get group_relationship_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get group_relationship_destroy_url
    assert_response :success
  end
end
