class LeadsController < ApplicationController
    
    def create
        @lead = Lead.new(lead_params)
        
        if @lead.save
            # Handle goos save.
            flash[:success] = "Thanks for your message. \n We will get back with you as soon as possible."
            lead_email(@lead)
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
    
    def lead_email(lead)
        if params[:lead][:email].blank?
            #what to do if email is blank
        else
            #what to do if email is present
            LeadMailer.welcome_to_new_lead_email(lead).deliver_now!
            LeadMailer.notify_about_new_lead(lead).deliver_now!
        end 
    end
    
end
