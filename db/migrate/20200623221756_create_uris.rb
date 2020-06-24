class CreateUris < ActiveRecord::Migration[6.0]
  def change
    create_table :uris do |t|
      t.string :uri
      t.string :shorten_uri

      t.timestamps
    end
    add_index :uris, :uri, unique: true
  end
end
