json.extract! image, :id, :title, :pic, :user_id, :article_id, :created_at, :updated_at
json.url image_url(image, format: :json)
