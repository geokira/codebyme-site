class Lead < ActiveRecord::Base
    before_save {self.email = email.downcase}
    validates :name, presence: true
    validates :phone, :presence => {:message => "can't be blank, unless email is present."}, unless: -> (lead){lead.email.present?}
    validates :email, :presence => {:message => "can't be blank, unless phone is present."}, unless: -> (lead){lead.phone.present?}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX}, :allow_blank => true
end
