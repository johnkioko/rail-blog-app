require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Ashanti', bio: 'I am a little girl', post_counter: 1,
                     photo: 'https://google.com/googleIcon.png')

    @post = Post.new(title: 'Forth post', text: 'Omoooooooooo', author_id: 1, comment_counter: 1, likes_counter: 1)
    @like = Like.create(author: @user, post: @post)
  end

  it 'comment counter to match' do
    expect(@post.likes_counter).to eq 1
  end

  it 'update like counter' do
    expect(@like.update_likes_counter).to be(true)
  end
end
