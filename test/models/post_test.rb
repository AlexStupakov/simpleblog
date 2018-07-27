require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # valid_params = {name: 'Some Author.', content: 'some content'}
  # valid_params = posts(:valid).attributes
  test 'should be valid' do
    post = Post.new(posts(:valid).attributes)
    assert post.valid?
  end

  test 'name without dot' do
    params = posts(:valid).attributes.merge name: 'Some Author'
    post = Post.new(params)
    assert_not post.valid?
  end

  test 'name not capitalized words' do
    params = posts(:valid).attributes.merge name: 'some Author.'
    post = Post.new(params)
    assert_not post.valid?
  end

  test 'name 1 char word' do
    params = posts(:valid).attributes.merge name: 'Some A.'
    post = Post.new(params)
    assert_not post.valid?
  end

  test 'name have not 2 words' do
    params = posts(:valid).attributes.merge name: 'Author.'
    post = Post.new(params)
    assert_not post.valid?
  end

  test 'do not have a content' do
    params = posts(:valid).attributes.merge content: ''
    post = Post.new(params)
    assert_not post.valid?
  end
end
