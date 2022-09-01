Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '/api/*',
             headers: %w[Authorization],
             methods: %i[get post patch put delete options],
             expose: %w[Authorization]
  end
end
