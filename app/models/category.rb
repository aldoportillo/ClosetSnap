# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

  has_many  :itemcategories, class_name: "Itemcategory", foreign_key: "category_id", dependent: :destroy
  has_many :categories, through: :itemcategories
  
end
