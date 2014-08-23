json.array!(@urls) do |url|
  json.extract! url, :id, :chapter_id, :order, :content
  json.url url_url(url, format: :json)
end
