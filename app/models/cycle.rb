# == Schema Information
#
# Table name: cycles
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cycle < ApplicationRecord
    
    belongs_to :user
    has_one :shipment, :dependent => :destroy

end
