class AddVideoToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :video, :string
  end
end
