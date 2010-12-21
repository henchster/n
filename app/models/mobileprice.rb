class Mobileprice < ActiveRecord::Base
  belongs_to :mobilephone

  scope :free, where(:iop => 0)
end
