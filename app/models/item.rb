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
end
