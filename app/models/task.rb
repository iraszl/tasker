class Task < ApplicationRecord
  acts_as_list scope: [:list_id, completed_at: nil], top_of_list: 0
  belongs_to :list

  scope :incomplete_first, -> { order(completed_at: :desc) }

  def complete?
    completed_at.present?
  end

  validates :name, presence: true
  validates :name, length: { minimum: 2, too_short: "too short" }

end
