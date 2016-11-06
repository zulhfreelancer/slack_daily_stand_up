class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :user
      t.text :done_yesterday
      t.text :doing_today
      t.text :with_group
      t.text :pending_pr
      t.text :stopping
      t.text :not_clear
      t.text :need_anything
      t.text :still_stuck

      t.timestamps
    end
  end
end
