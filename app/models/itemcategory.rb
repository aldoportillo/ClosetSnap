# == Schema Information
#
# Table name: itemcategories
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  item_id     :integer
#
class Itemcategory < ApplicationRecord
end
