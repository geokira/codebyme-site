class LeadMailer < ApplicationMailer
    default from: "dmiranda@codebyme.com"
    
    messsage={}
    
    def welcome_to_new_lead_email(lead)
        @lead = lead
        message={}
        message[:from] = "Dorian @ Code by Me <dmiranda@codebyme.com>"
        message[:to] = @lead.email
        message[:subject] = "Code by Me say Thank You!"
        mail(message)
    end
    
    def notify_about_new_lead(lead)
        @lead = lead
        message={}
        message[:from] = "New Lead Code by Me <noreply@codebyme.com>"
        message[:to] = "info@codebyme.com"
        message[:subject] = Time.zone.now.strftime("%Y%m%d-%^b-%j-%l:%M %p") + " New Lead: " + @lead.name 
        mail(message)
    end
end
