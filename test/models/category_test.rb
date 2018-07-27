require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  require 'test_helper'

  test 'should be valid' do
    comment = Category.new(categories(:valid).attributes)
    assert comment.valid?
  end

  test 'name without dot' do
    params = categories(:valid).attributes.merge name: 'Some Author'
    comment = Category.new(params)
    assert_not comment.valid?
  end

  test 'name not capitalized words' do
    params = categories(:valid).attributes.merge name: 'some Author.'
    comment = Category.new(params)
    assert_not comment.valid?
  end

  test 'name 1 char word' do
    params = categories(:valid).attributes.merge name: 'Some A.'
    comment = Category.new(params)
    assert_not comment.valid?
  end

  test 'name have not 2 words' do
    params = categories(:valid).attributes.merge name: 'Author.'
    comment = Category.new(params)
    assert_not comment.valid?
  end

  test 'do not have a description' do
    params = categories(:valid).attributes.merge description: ''
    comment = Category.new(params)
    assert_not comment.valid?
  end
end
