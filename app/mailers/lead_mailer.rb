class LeadMailer < ApplicationMailer
    default from: "dmiranda@mg.codebyme.com"

    messsage={}

    def welcome_to_new_lead_email(lead)
        @lead = lead
        message={}
        message[:from] = "Dorian @ Code by Me <dmiranda@mg.codebyme.com>"
        message[:to] = @lead.email
        message[:subject] = "Code by Me say Thank You!"
        email = mail(message)
        email.mailgun_headers = {'Reply-To': 'info@codebyme.com'}
    end

    def notify_about_new_lead(lead)
        @lead = lead
        message={}
        message[:from] = "New Lead Code by Me <noreply@mg.codebyme.com>"
        message[:to] = "info@codebyme.com"
        message[:subject] = Time.zone.now.strftime("%Y%m%d-%^b-%j-%l:%M %p") + " New Lead: " + @lead.name
        mail(message)
    end
end
