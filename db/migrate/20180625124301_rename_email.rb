class RenameEmail < ActiveRecord::Migration[5.2]
  def change
  	change_table :users do |t|
  		t.rename :email, :name
  	end
  end
end
