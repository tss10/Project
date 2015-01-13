class Information < ActiveRecord::Base
  has_and_belongs_to_many :reports
  belongs_to :user
  has_attached_file :task_file
  has_attached_file :code_file
  do_not_validate_attachment_file_type :task_file
  do_not_validate_attachment_file_type :code_file
end
