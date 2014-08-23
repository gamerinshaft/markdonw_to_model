json.array!(@headings) do |heading|
  json.extract! heading, :id, :chapter_id, :order, :content
  json.url heading_url(heading, format: :json)
end
