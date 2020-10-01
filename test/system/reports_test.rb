require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    # @report = reports(:one)
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
    click_on 'Edit', match: :first

    fill_in 'Content', with: @report.content
    fill_in 'Title', with: @report.title
    click_on 'Update Report'

    assert_text 'Report was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Report was successfully destroyed'
  end
end
