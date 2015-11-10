class LeadsController < ApplicationController
    def create
        @lead = Lead.new(lead_params)
        
        if @lead.save
            # Handle goos save.
            flash[:success] = "Thanks for your message. \n We will get back with you as soon as possible."
            lead_email
            redirect_to root_path
        else
            # Problem with saving.
            flash[:danger] = "Something went wrong on your request. Try again with some changes in your data."
            render 'welcome/index'
        end
    end
    
    
    private
    
    def lead_params
        params.require(:lead).permit(:name, :email, :phone, :message)
    end
    
    def lead_email
        if params[:lead][:email].blank?
            #what to do if email is blank
        else
            #what to do if email is present
            send_simple_message(params[:lead][:email])
        end 
    end
    
    def send_simple_message (recipient = "")
        mg_client = Mailgun::Client.new MAILGUN_API_KEY
        message_params = {:from => 'Dorian @ Code by Me <dmiranda@codebyme.com>',
            :to => recipient,
            :subject => 'Trying out the SDK for Ruby',
            :text => 'This is an api call result Checkout our locations section',
            :html => "<html><body>this is an api call result Checkout our <a href=\"http://www.google.com\"> locations </a></body></html>"}
        mg_client.send_message "mg.codebyme.com", message_params
    end
end
