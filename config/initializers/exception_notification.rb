if Rails.env == "production" || Rails.env == "staging" || Rails.env == "development"

exceptions = []
exceptions << 'ActiveRecord::RecordNotFound'
exceptions << 'AbstractController::ActionNotFound'
exceptions << 'ActionController::RoutingError'
exceptions << 'ActionController::InvalidAuthenticityToken'

server_name = case Rails.env
                when "production"  then "mystore.com"
                when "staging"     then "staging.my.store"
                when "development" then "DEVELOPMENT mystore"
                else
                  "unknown env mystore"
              end

MyStore::Application.config.middleware.use ExceptionNotification::Rack,
                                           :email=> {
                                               :email_prefix =>   "[#{server_name} error] ",
                                               :sender_address =>"error500@mystore.com",
                                               :exception_recipients => ["vitaliy.grinyov@gmail.com"]
                                           },
                                           ignore_exceptions: exceptions

end