class AddForeignKeysToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :series, foreign_key: true
    add_reference :posts, :category, foreign_key: true
  end
end
