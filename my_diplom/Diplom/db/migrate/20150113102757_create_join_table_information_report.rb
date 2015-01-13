class CreateJoinTableInformationReport < ActiveRecord::Migration
  def change
    create_join_table :information, :reports
  end
end
