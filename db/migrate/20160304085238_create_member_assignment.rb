class CreateMemberAssignment < ActiveRecord::Migration
  def change
  	create_table :members do |t|
      t.string :name

      t.references :group, index: true, foreign_key: true
      t.timestamps null: false
    end
 
    create_table :assignments do |t|
      t.string :name
      t.string :repo_name
      t.date :due_date

      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.timestamps null: false
    end
 
    create_table :member_assignments do |t|
      t.references :member, index: true
      t.references :assignment, index: true, foreign_key: true
      t.string :link
      t.timestamps null: false
    end
  end
end
