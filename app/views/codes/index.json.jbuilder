json.array!(@codes) do |code|
  json.extract! code, :id, :chapter_id, :order, :content
  json.url code_url(code, format: :json)
end
