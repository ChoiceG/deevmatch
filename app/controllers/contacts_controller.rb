class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
      @contact = Contact.new(contact_params)
      if @contact.save
          name = params[:contact][:name]
          email = params[:contact][:email]
          body = params[:contact][:comments]

          ContactMailer.contact_email(name, email, body).deliver

          flash[:success] = "Message sent."
          redirect_to new_contact_path
      else
          flash[:danger] = @contact.errors.full_messages.join(", ")
          redirect_to new_contact_path
      end

  rescue StandardError => e
    Rails.logger.error("Error in ContactsController#create: #{e.message}")
    render plain: "Internal Server Error", status: :internal_server_error
  end

  private
    def contact_params
        params.require(:contact).permit(:name, :email, :comments)
    end
end
