class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.column :filename, :string
      t.column :path,    :string
      t.column :md5_hash, :string
      t.timestamps
    end
    add_index :contents, :md5_hash
  end

  def self.down
    drop_table :contents
  end
end
