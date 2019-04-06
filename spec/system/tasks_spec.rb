require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'UserA', email: 'a@example.com')
      FactoryBot.create(:task, name: 'FirstTask', user: user_a)
    end

    context 'ユーザAがログインしているとき' do
      before do
        visit login_path
        fill_in 'EMAIL', with: 'a@example.com'
                fill_in 'PASSWORD', with: 'password'
        click_button 'LOGIN'
      end
      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content 'FirstTask' 
      end
    end

    context 'ユーザーBがログインしているとき' do
      before do 
        FactoryBot.create(:user, name: 'UserB', email: 'b@example.com')
        visit login_path
        fill_in 'EMAIL', with: 'b@example.com'
        fill_in 'PASSWORD', with: 'password'
        click_button 'LOGIN'
      end
      it 'ユーザーAが作成したタスクが表示されない' do
        expect(page).to have_no_content 'FirstTask'
      end
    end
  end
end

