require "test_helper"

class TodoItemTest < ActiveSupport::TestCase
  setup do
    @list = TodoList.create(title:'abc', description: 'aaa')
    @item = TodoItem.create(content: 'abc', todo_list_id: @list.id)
  end

  test "invalid without content" do
    model = TodoItem.new(content: '')
    assert_not model.valid?
  end

  test 'valid with content' do
    model = TodoItem.new(content: 'abc', todo_list_id: @list.id)
    assert model.valid?
  end

  test 'is completed if completed_at is present' do
    @item.update(completed_at: Time.now)
    assert @item.completed?
  end

  test 'isnt completed if completed_at is blank' do
    assert_not @item.completed?
  end

end
