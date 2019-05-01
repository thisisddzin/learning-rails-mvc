json.extract! coin, :id, :title, :acronym, :image_url, :created_at, :updated_at
json.url coin_url(coin, format: :json)
