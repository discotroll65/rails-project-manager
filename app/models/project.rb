class Project < ActiveRecord::Base
  has_many :project_users
  has_many :users, through: :project_users
  has_many :tasks, inverse_of: :project
  validates :name, presence: true

  accepts_nested_attributes_for :tasks

end
