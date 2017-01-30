class CreateTeams < ActiveRecord::Migration[5.0]
  def up
    create_table :teams do |t|
      t.string :team_id
      t.string :name
      t.string :domain
      t.string :token
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
