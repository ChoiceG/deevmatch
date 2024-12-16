require 'mailgun-ruby'

class ContactMailer < ApplicationMailer
  default to: "efechoice@gmail.com"

  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY']) #Use the API key here

    mg_client.send_message(ENV['MAILGUN_DOMAIN'],{
    mail(from: email, subject: "Contact Form Message")
    })
  end
end