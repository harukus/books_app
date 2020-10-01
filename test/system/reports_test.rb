require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
    visit root_url
    fill_in 'Email', with: 'bump@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the reports' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '日報作成'

    fill_in 'タイトル', with: '新しいLinuxの教科書を読む'
    fill_in '内容', with: '楽しい！'
    click_on '登録する'

    assert_text '作成しました。'
    assert_text '新しいLinuxの教科書を読む'
    assert_text '楽しい！'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'Ruby超入門第１章'
    fill_in '内容', with: 'とっても楽しく勉強できた'
    click_on '更新する'

    assert_text '更新しました。'
    assert_text 'Ruby超入門第１章'
    assert_text 'とっても楽しく勉強できた'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '削除しました。'
  end
end
