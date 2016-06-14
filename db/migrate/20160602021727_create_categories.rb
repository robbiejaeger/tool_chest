class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps null: false
    end

    add_column :tools, :category_id, :integer
    add_foreign_key :tools, :categories
  end
end
