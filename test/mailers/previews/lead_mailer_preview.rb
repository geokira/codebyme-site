# Preview all emails at http://localhost:3000/rails/mailers/lead_mailer
class LeadMailerPreview < ActionMailer::Preview
    def lead_mail_preview
        LeadMailer.welcome_to_new_lead_email(Lead.first)
    end
end
