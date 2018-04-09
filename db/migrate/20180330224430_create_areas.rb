class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :neighborhood

      t.timestamps
    end
  end
end
