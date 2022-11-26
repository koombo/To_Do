require "test_helper"

class TodoListTest < ActiveSupport::TestCase
  @list1 = TodoList.create(title:'abc', description: 'aaa')

  test "invalid without params" do
    list = TodoList.new(title: '', description: '')
    assert_not list.valid?
  end

  test 'valid with params' do
    list = TodoList.new(title: 'aaa', description: 'ccc')
    assert list.valid?
  end

end
