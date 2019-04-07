require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    let(:user_a) { FactoryBot.create(:user, name: 'UserA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'UserB', email: 'b@example.com') }

    before do
      FactoryBot.create(:task, name: 'FirstTask', user: user_a)
      visit login_path
      fill_in 'EMAIL', with: login_user.email
      fill_in 'PASSWORD', with: login_user.password
      click_button 'LOGIN'
    end

    context 'ユーザAがログインしているとき' do 
      let(:login_user) { user_a }

      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content 'FirstTask' 
      end
    end

    context 'ユーザーBがログインしているとき' do
      let (:login_user) { user_b }

      it 'ユーザーAが作成したタスクが表示されない' do
        expect(page).to have_no_content 'FirstTask'
      end
    end
  end
end

