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

  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id"
  belongs_to :item, required: true, class_name: "Item", foreign_key: "item_id"
  
end
