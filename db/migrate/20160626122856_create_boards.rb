class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references  :user,  null: false
      t.string      :name,  null: false
      t.timestamps          null: false
    end

    add_index :boards, :user_id
  end
end
