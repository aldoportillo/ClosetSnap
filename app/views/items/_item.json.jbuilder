json.extract! item, :id, :name, :image_url, :size, :compliments, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
