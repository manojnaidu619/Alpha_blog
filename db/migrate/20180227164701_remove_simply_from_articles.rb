class RemoveSimplyFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :simply, :integer
  end
end
