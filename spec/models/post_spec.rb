require 'rails_helper'

RSpec.describe Post, type: :model do

  context 'validation tests' do
    current_user = User.first_or_create!(email: 'ext@example.com', password: 'password', password_confirmation: 'password')
    it 'ensures title presence' do
      post = Post.new(content: 'stuff', date: '09092021').save
      expect(post).to eq(false)
    end

    it 'ensures content presence' do
      post = Post.new(title: 'stuff', date: '09092021').save
      expect(post).to eq(false)
    end

    it 'ensures date presence' do
      post = Post.new(title: 'stuff', content: 'stuff').save
      expect(post).to eq(false)
    end

    it 'saves successfully' do
      post = Post.new(title: 'stuff', content: 'stuff', date: '09092021', user: current_user).save
      expect(post).to eq(true)
    end

  end
end
