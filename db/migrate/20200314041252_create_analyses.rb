class CreateAnalyses < ActiveRecord::Migration[6.0]
  def change
    create_table :analyses do |t|
      t.references :before_image
      t.text :comment
      t.text :description
      t.text :annotation_json

      t.timestamps
    end
  end
end
