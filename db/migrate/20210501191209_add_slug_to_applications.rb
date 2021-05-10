class AddSlugToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :slug, :string
    add_index :applications, :slug, unique: true
  end
end
