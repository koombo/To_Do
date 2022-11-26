class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  validates_presence_of :description, :title, :message => "nie może być puste"
end