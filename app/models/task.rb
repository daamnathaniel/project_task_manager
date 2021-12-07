class Task < ApplicationRecord
  belongs_to :project

  def self.get_by_status(status)
    self.all.select do |task|
        task.status == status
    end
  end
end