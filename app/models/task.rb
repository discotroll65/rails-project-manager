class Task < ActiveRecord::Base
  belongs_to :project, inverse_of: :tasks
  validates :name, :status, :project, presence: true
  validates_inclusion_of :status, in: %w[unstarted started finished]
end
