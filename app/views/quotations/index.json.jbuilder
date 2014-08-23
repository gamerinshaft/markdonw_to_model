json.array!(@quotations) do |quotation|
  json.extract! quotation, :id, :chapter_id, :order, :content
  json.url quotation_url(quotation, format: :json)
end
