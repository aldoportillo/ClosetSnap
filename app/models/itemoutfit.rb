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
end
