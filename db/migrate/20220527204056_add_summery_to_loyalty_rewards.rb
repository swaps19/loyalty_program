class AddSummeryToLoyaltyRewards < ActiveRecord::Migration[7.0]
  def change
    add_column :loyalty_rewards, :summery, :int, default: 0
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
