require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Email', with: 'bump@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'follow/unfollow user' do
    visit root_path
    click_link 'ユーザー一覧'

    bump = users(:bump)
    harukus = users(:harukus)
    assert_text 'harukus@example.com'
    assert_link 'フォローする'
    assert_not bump.reload.following?(harukus)

    click_link 'フォローする'
    assert_link 'フォロー外す'
    assert bump.following?(harukus)

    click_link 'フォロー外す'
    assert_text 'フォローする'
    assert_not bump.reload.following?(harukus)
  end
end
