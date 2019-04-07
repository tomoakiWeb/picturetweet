require 'rails_helper'

describe TweetsController, type: :controller do

  describe 'GET #new' do
    it "正しいビューに変遷する" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@tweetが期待した値をもつ" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(assigns(:tweet)).to eq tweet
    end

    it "正しいビューに遷移する" do
      tweet = create(:tweet)
      get :edit, params: {id: tweet }
      expect(response).to render_template :edit
    end
  end
end




