class CreateJoinTablePostsHashTags < ActiveRecord::Migration[8.1]
  def change
    create_join_table :posts, :hash_tags do |t|
      # t.index [:post_id, :hash_tag_id]
      # t.index [:hash_tag_id, :post_id]
    end
  end
end
