# frozen_string_literal: true

json.extract! location, :id, :created_at, :updated_at
json.url location_url(location, format: :json)
