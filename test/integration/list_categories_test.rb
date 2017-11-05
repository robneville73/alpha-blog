require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end

  # test "get new category form and create category" do
  #   get new_category_path
  #   assert_template 'categories/new'
  #   assert_difference 'Category.count', 1 do
  #     post categories_path, params: { category: {name: "sports"} }
  #     follow_redirect!
  #   end
  #   assert_template 'categories/index'
  #   assert_match "sports", response.body
  # end

end