require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:attack_on_titan)

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

    fill_in 'タイトル', with: 'ドラゴンボール'
    fill_in 'メモ', with: 'ワクワクストーリー'
    fill_in '著者', with: '鳥山明'
    click_on '登録する'

    assert_text '作成しました。'
    assert_text 'ドラゴンボール'
    assert_text 'ワクワクストーリー'
    assert_text '鳥山明'
  end

  test 'updating a Book' do
    visit books_url
    assert_text '進撃の巨人'
    assert_text 'ハラハラドキドキ'
    assert_text '諫山創'
    click_link '編集'

    fill_in 'タイトル', with: 'ドラゴンボール'
    fill_in 'メモ', with: 'ワクワクストーリー'
    fill_in '著者', with: '鳥山明'
    click_on '更新する'

    assert_text '更新しました。'
    assert_text 'ドラゴンボール'
    assert_text 'ワクワクストーリー'
    assert_text '鳥山明'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text '進撃の巨人'
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '削除しました。'
    assert_no_text '進撃の巨人'
  end

  test 'creating a comment' do
    visit books_url
    click_on '詳細'
    fill_in 'comment[content]', with: '確かに面白い'
    click_button 'コメントする'

    assert_text 'bump@example.com'
    assert_text '確かに面白い'
  end
end
