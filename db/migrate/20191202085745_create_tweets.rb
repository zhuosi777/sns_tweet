class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|

      t.string      :name
      t.text        :text
      t.string        :image
      t.timestamps  null: true
    end
  end
end
