# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ApplicationRecord
    belongs_to :user
    has_many :shipments, :dependent => :destroy
end
