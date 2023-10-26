class CreateStrolls < ActiveRecord::Migration[7.1]
  def change
    create_table :strolls do |t|
      
      t.belongs_to :dog, index: true
      t.belongs_to :dogsitter, index: true
      t.belongs_to :city, index: true
      t.string :date
      t.string :datetime

      t.timestamps
    end
  end
end
