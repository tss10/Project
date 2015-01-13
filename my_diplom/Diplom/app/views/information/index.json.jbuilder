json.array!(@information) do |information|
  json.extract! information, :id, :task_text, :code_text
  json.url information_url(information, format: :json)
end
