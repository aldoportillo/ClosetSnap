# == Schema Information
#
# Table name: itemoutfits
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  outfit_id  :integer
#
class Itemoutfit < ApplicationRecord

  belongs_to :item, required: true, class_name: "Item", foreign_key: "item_id"
  belongs_to :outfit, required: true, class_name: "Outfit", foreign_key: "outfit_id"

end
