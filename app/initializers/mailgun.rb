require "mailgun-ruby"

Mailgun.configure do |config|
    config.api_key = "https://api:YOUR_API_KEY"\
  	"@api.mailgun.net/v3/sandbox2bf6a875aee649ee9e332574575a5a2d.mailgun.org/messages",
    config.domain = "https://app.mailgun.com/app/sending/domains/sandbox2bf6a875aee649ee9e332574575a5a2d.mailgun.org"
end