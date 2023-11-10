# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  compliments :integer
#  image_url   :string
#  name        :string
#  size        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Item < ApplicationRecord

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  has_many :itemoutfits, dependent: :destroy
  has_many :outfits, through: :itemoutfits

  has_many  :itemcategories, class_name: "Itemcategory", foreign_key: "item_id", dependent: :destroy
  has_many :categories, through: :itemcategories

  

end
