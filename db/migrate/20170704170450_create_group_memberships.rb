class CreateGroupMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :group_memberships do |t|

      t.timestamps
    end
  end
end
