class AddEmailAttributeToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :email, :string
    @messages = Message.find(:all)
     @messages.each do |message|
      message.update_attribute(:email, 'test@big.com')
     end
  end

  def self.down
    remove_column :messages, :email
  end
end
