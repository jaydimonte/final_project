# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  super      :integer
#  medium     :integer
#  lite       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
    belongs_to :user
has_many :shipments, :dependent => :destroy
end
