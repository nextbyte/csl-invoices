class Customer < ActiveRecord::Base
  belongs_to :contact
  validates :email, :email_format => {:message => 'This is not an e-mail standard format. Please enter a valid e-mail address'}
  attr_accessible :address_1, :address_2, :city, :company, :first_name, :last_name, :postcode, :contact_number, :email, :contact_id

  def name
    return "#{first_name} #{last_name}"
  end
end