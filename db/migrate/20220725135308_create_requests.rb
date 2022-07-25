class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :response_time
      t.string :duration
      t.string :message

      t.timestamps
    end
  end
end
