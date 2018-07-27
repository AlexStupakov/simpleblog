require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'should be valid' do
    comment = Comment.new(comments(:valid).attributes)
    assert comment.valid?
  end

  test 'author without dot' do
    params = comments(:valid).attributes.merge author: 'Some Author'
    comment = Comment.new(params)
    assert_not comment.valid?
  end

  test 'author not capitalized words' do
    params = comments(:valid).attributes.merge author: 'some Author.'
    comment = Comment.new(params)
    assert_not comment.valid?
  end

  test 'author 1 char word' do
    params = comments(:valid).attributes.merge author: 'Some A.'
    comment = Comment.new(params)
    assert_not comment.valid?
  end

  test 'author have not 2 words' do
    params = comments(:valid).attributes.merge author: 'Author.'
    comment = Comment.new(params)
    assert_not comment.valid?
  end

  test 'do not have a content' do
    params = comments(:valid).attributes.merge content: ''
    comment = Comment.new(params)
    assert_not comment.valid?
  end
end
