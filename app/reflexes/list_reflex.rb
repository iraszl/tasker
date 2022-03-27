class ListReflex < StimulusReflex::Reflex
  def create_task
    sleep 2
    list = List.find(element.dataset.list_id)
    task = list.tasks.create(task_params)
    if task.errors.present?
      error_messages = task.errors.full_messages.join", "
      raise error_messages
    end
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end
end