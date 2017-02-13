class CreateArticules < ActiveRecord::Migration[5.0]
  def change
    create_table :articules do |t|
      t.string :nombre
      t.text :empresa
      t.text :comentario
      t.text :link_youtube

      t.timestamps
    end
  end
end
