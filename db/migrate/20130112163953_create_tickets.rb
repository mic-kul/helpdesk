class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :topic
      t.text :message
      t.references :user
      t.references :category
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
