require 'test_helper'

class PostTest < ActiveSupport::TestCase
  describe Post do
    before(:each) do
      @post = Post.new
    end

    it "should be valid" do
      @post.should be_valid
    end
  end
end
