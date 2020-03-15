class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :before_image
      t.text :content
      t.text :description
      t.text :annotation_json

      t.timestamps
    end
  end
end
