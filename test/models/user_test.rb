require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'name_or_email(email)' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
  end

  test 'name_or_email(name)' do
    user = User.new(email: 'foo@example.com', name: 'foo')
    assert_equal 'foo', user.name_or_email
  end

  test 'unfollow' do
    harukus = users(:harukus)
    bump = users(:bump)

    harukus.follow(bump.id)
    assert harukus.following?(bump)
    harukus.unfollow(bump.id)
    assert_not harukus.following?(bump)
  end
end
