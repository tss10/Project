class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :report_text
      t.belongs_to :user

      t.timestamps
    end
  end
end
