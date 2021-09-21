require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'ext@example.com', password: 'password', password_confirmation: 'password')
  content_text = "this is a reasonable amount of text for a blog post"
  context 'validation tests' do

    it 'ensures title presence' do
      post = Post.new(views: '0', content: 'stuff', date: '09092021', user_id: 1)
      expect(post).to_not be_valid
    end



    it 'ensures content presence' do
      post = Post.new(views: 1, title: 'stuff', date: '09092021',user_id: 1)
      expect(post).to_not be_valid
    end

     it 'ensures 50char min cont' do
      post = Post.new(title: 'stuff', content: 'too small', date: '095159', views: 2, user_id:1)
      expect(post).to_not be_valid
    end

    it 'ensures 2char min title' do
      post = Post.new(title: '1', content: content_text, date: '095159', views: 2, user_id:1)
      expect(post).to_not be_valid
    end

    it 'ensures date presence' do
      post = Post.new(views: 1, title: 'stuff', content: content_text, user_id: 1)
      expect(post).to_not be_valid
    end
    it 'ensures views presence' do
      post = Post.new(title: 'stuff', content: content_text, date: '090921', user_id: 1)
      expect(post).to_not be_valid
    end

    it 'ensures views are numbers' do
      post = Post.new(title: 'stuff', content: content_text, date: '090921', views: 'sdfasdf', user_id: 1)
       expect(post.views).to be_a(Integer)
    end

    it 'saves successfully' do
      post = Post.new(title: 'stuff', content: content_text, date: '09092021', user_id: 1, views: 1)
      expect(post).to be_valid
    end

  end

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end
end
