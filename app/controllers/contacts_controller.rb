class ContactsController < ApplicationController
before_action :authenticate_admin!,except: [:new,:create]
def index
  	@contact = Contact.all.order("created_at DESC")
  end

  def new
  	@contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
       flash[:notice] = "Message successfully sent"
    	redirect_to new_contact_path
    else
    	render 'new'
    end
  end

  def edit
  	@contact = Contact.find(params[:id])
  end

  def show
  	@contact = Contact.find(params[:id])  	
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
     redirect_to contacts_path
     else    
      flash[:notice] ="Thank you for your message. I will response soon !!!"
      redirect_to contact_path
    end
    
  end
  private 
  def contact_params
  	params.require(:contact).permit(:name,:email,:message)
  end
end
