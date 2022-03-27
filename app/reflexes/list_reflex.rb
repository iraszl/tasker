class ListReflex < StimulusReflex::Reflex
  def create_task
    list = List.find(element.dataset.list_id)
    @new_task = list.tasks.create(task_params)
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end
end