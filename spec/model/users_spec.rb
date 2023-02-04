require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Ashanti', bio: 'I am a little girl', post_counter: 1,
                     photo: 'https://google.com/googleIcon.png')
  end

  it 'name must not be blank' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'user bio to match' do
    @user.bio = 'Ashanti is a girl'
    expect(@user).to be_valid
  end

  it 'Check if postscounter is an integer' do
    @user.post_counter = 'Random'
    expect(@user).to_not be_valid
  end

  describe 'check methods' do
    before do
      @user1 = User.create(name: 'Ashanti', photo: 'https://ww.googlecom/google,png', bio: 'I ama  girl', post_counter: 1)

      5.times do
        Post.create(title: 'Main', text: 'First post', author_id: 1, comment_counter: 1, likes_counter: 0)
      end
    end

    it 'returns last 3posts' do
      expect(@user1.three_posts).to match_array(@user1.posts.last(3))
    end
  end
end
