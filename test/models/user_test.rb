require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
  end

  test 'unfollow' do
    harukus = User.create!(email: 'harukus@example.com', password: 'password')
    bump = User.create!(email: 'bump@example.com', password: 'password')

    harukus.follow(bump.id)
    assert harukus.following?(bump)
    harukus.unfollow(bump.id)
    assert_not harukus.following?(bump)
  end
end
