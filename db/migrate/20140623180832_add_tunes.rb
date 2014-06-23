class AddTunes < ActiveRecord::Migration
  def change
    create_table :tunes do |t|
      t.string :song_title
      t.string :author
      t.timestamps
    end
  end
end
