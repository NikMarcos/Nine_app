class AddThemeColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :theme, :integer
  end
end
