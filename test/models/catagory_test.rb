require 'test_helper'
class CategoryTest < ActiveSupport::TestCase
  
        def setup 
          #whatevers in here will run before each test
          @category = Category.new(name:"Sports")
        end 
    test "category should be valid" do 
    assert @category.valid?  
    end  

    test "name should be present" do 
        @category.name = " "
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save 
        @crategory2 = Category.new(name: "Sports" )
        assert_not @crategory2.valid?
    end

    test "name should not be to long" do
        @category.name = "a" * 17
        assert_not @category.valid?
    end 

    test "name should not be to short" do
        @category.name = "aaa" 
        assert_not @category.valid?
    end

end