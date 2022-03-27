class ListsController < ApplicationController
  def index
    @lists = List.all
    @new_task ||= Task.new
    @new_task = Task.new if @new_task.persisted?
  end
end
