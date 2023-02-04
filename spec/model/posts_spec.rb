require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Ashanti', bio: 'I am a little girl',
                     photo: 'https://google.com/googleIcon.png')

    @post = Post.new(title: 'Omoooo', text: 'Hey there', author_id: 1)
  end

  it 'title must not be blank' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'comment counter to match' do
    @post.comment_counter = -1
    expect(@post).to_not be_valid
  end

  it 'likes counter to match' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  it 'Check if comment_counter is an integer' do
    @post.comment_counter = 'heyyy'
    expect(@post).to_not be_valid
  end

  it 'Check if like count is an integer' do
    @post.likes_counter = 'heyyyy'
    expect(@post).to_not be_valid
  end

  describe 'Check for post methods' do
    before do
      @user2 = User.create(id: 1, name: 'Ashanti', bio: 'I am a little girl', post_counter: 1, photo: 'https://google.com/googleIcon.png')

      @post2 = Post.create(title: 'Omooo', text: 'Hey there', author: @user2, comment_counter: 0, likes_counter: 0)

      6.times do
        Comment.create(author: @user2, post: @post2, text: 'Why hmmmmmmm?')
      end
    end

    it 'return array of 5 recent comments' do
      expect(@post).to respond_to(:five_recent_comments)
    end

    it 'should return array of 5' do
      expect(@post2.five_recent_comments.length).to eql(5)
    end

    it 'should not return an empty array' do
      expect(@post2.five_recent_comments.length).to_not eql(0)
    end
  end
end
