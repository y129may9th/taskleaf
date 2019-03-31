require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'UserA', email: 'a@example.com')
      FactoryBot.create(:task, name: 'First Task', user: user_a)
    end
    
    context 'ユーザーAがログインしているとき' do
      before do
        visit login_path
        fill_in 'mail address', with: 'a@example.com'
                fill_in 'password', with: 'password'
        click_button 'login'
      end

      it 'ユーザーAが作成したタスクが表示される' do
      　expect(page).to have_content 'First Task'
      end
    end
  end
end
