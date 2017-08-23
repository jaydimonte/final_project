# == Schema Information
#
# Table name: shipments
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  cycle_id   :integer
#  address_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shipment < ApplicationRecord
    belongs_to :user
    # belongs_to :tracker, :class_name => "Cycle", :foreign_key => "cycle_id"
    belongs_to :order
    belongs_to :cycle
    belongs_to :address
end
