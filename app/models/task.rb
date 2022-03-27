class Task < ApplicationRecord
  belongs_to :list

  scope :incomplete_first, -> { order(completed_at: :desc, created_at: :asc) }

  def complete?
    completed_at.present?
  end

  validates :name, presence: true
  validates :name, length: { minimum: 2, too_short: "too short" }

end
