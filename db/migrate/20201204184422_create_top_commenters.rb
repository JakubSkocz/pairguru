class CreateTopCommenters < ActiveRecord::Migration[5.2]
  def change
    create_table :top_commenters do |t|

      t.timestamps
    end
  end
end
