class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :employer
      t.string :email
      t.string :category

      t.timestamps
    end
  end
end
