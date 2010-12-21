class Mobileprofile < ActiveRecord::Base
  belongs_to :mobilephone

  scope :noncam, where(:cprimary => "No")
end

