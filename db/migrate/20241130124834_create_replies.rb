class CreateReplies < ActiveRecord::Migration[8.1]
  def change
    create_table :replies do |t|
      t.text :body
      t.string :author
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
