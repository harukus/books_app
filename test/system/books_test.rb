require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)

    visit root_url
    fill_in 'Email', with: 'bump@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: 'Books'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'メモ', with: @book.memo
    fill_in 'タイトル', with: @book.title
    click_on '登録する'

    assert_text '作成しました。'
    click_link '戻る'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'メモ', with: @book.memo
    fill_in 'タイトル', with: @book.title
    click_on '更新する'

    assert_text '更新しました。'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '削除しました。'
  end
end
