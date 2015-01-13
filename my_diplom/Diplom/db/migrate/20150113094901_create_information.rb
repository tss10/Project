class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.attachment :task_file
      t.attachment :code_file
      t.text :task_text
      t.belongs_to :user

      t.timestamps
    end
  end
end
