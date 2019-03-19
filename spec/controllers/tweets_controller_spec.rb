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

  describe 'GET #index' do
    it "降順でツイートが並ぶ" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "正しいビューに遷移する" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "@tweetが期待した値をもつ" do
      tweet = create(:tweet)
      get :show, params: { id: tweet}
      expect(assigns(:tweet)).to eq tweet
    end

    it "正しいビューに遷移する" do
      get :show, params: {id: tweet }
      expect(response).to render_template :show
    end
  end
  describe 'delete #destroy' do
    it "ツイートを削除する" do
      tweet = create(:tweet)
      expect {
        delete :destroy,params: { id: tweet}
      }.to change(Tweet,:count).by(0)
  end
    it "正しいビューに遷移する" do
      delete :destroy,params: {id: tweet}
      expect(response).to render_template :delete
    end
  end
end




