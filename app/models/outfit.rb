# == Schema Information
#
# Table name: outfits
#
#  id          :integer          not null, primary key
#  compliments :string
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Outfit < ApplicationRecord

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :itemoutfits, class_name: "Itemoutfit", foreign_key: "outfit_id", dependent: :destroy
  has_many :items, through: :itemoutfits

end
