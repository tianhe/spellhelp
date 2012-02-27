class CreateListWords < ActiveRecord::Migration
  def change
    create_table :list_words do |t|
      t.integer :list_id
      t.integer :word_id
      t.integer :order
      
      t.timestamps
    end
  end
end
