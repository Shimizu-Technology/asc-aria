# Be sure to restart your server when you modify this file.

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins(*ENV.fetch("FRONTEND_ORIGINS", "http://localhost:5173,http://127.0.0.1:5173,http://localhost:5197,http://127.0.0.1:5197").split(","))

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      expose: [ "Content-Type" ]
  end
end
