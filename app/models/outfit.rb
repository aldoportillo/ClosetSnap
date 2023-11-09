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
end
