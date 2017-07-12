json.array!(@votes) do |vote|
  json.extract! vote, :id, :user, :value
  json.url vote_url(vote, format: :json)
end
