require "test_helper"

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = todo_lists(:one)
    @todo_items = todo_items(:one)
  end

  test "should create todo_item" do
    assert_difference('TodoItem.count') do
      post todo_list_todo_items_path(todo_list_id: @list.id), params: { todo_item: { content: 'ac' }}
    end

    assert_redirected_to todo_list_url(@list)
  end
 

  test "should destroy todo_item" do
    assert_difference('TodoItem.count', -1) do
      delete todo_list_todo_item_url(todo_list_id: @list.id, id: @todo_items.id)
    end

    assert_redirected_to todo_list_url(@list)
    assert_equal 'Todo List item was deleted.', flash[:success]
  end

  test 'complete todo item' do
    assert_not @todo_items.completed_at.present?
    patch complete_todo_list_todo_item_url(todo_list_id: @list.id, id: @todo_items.id)
    assert @todo_items.reload.completed_at.present?

    assert_redirected_to todo_list_url(@list)
    assert_equal 'Todo item completed', flash[:notice]
  end
end
