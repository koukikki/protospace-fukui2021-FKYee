class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.references :user,           null: false,foreign_key: true
      t.string :name,               null: false
      t.text   :catch_copy,         null: false
      t.text   :concept,            null: false
      t.integer :assessment_ave
      t.timestamps
    end
  end
end
