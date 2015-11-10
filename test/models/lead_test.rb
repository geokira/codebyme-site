require 'test_helper'

class LeadTest < ActiveSupport::TestCase
    def setup
        @lead = Lead.new(name: "John Simmons", email: "john.simmons@aol.com", phone: "787-998-1232", message: "I need to get more information.")
    end
    
    test "should be valid" do
        assert @lead.valid?
    end
    
    test "lead name should be present" do
        @lead.name = "    "
        assert_not @lead.valid?
    end
    
    test "lead email or phone should be present" do
        @lead.email = "    "
        @lead.phone = "    "
        assert_not @lead.valid?
    end
    
    test "lead email present no phone" do
        @lead.phone = "    "
        @lead.email = "john.simmons@aol.com"
        assert @lead.valid?
    end
    
    test "lead phone present no email" do
        @lead.email = "    "
        @lead.phone = "787.720.1201"
        assert @lead.valid?
    end
    
    test "lead email validation should accept valid addresses" do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
            @lead.email = valid_address
            assert @lead.valid?, "#{valid_address.inspect} should be valid"
        end
    end
    
    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
            @lead.email = invalid_address
            assert_not @lead.valid?, "#{invalid_address.inspect} should be invalid"
        end
    end
        
    test "email addresses should be saved as lower-case" do
        mixed_case_email = "Foo@ExAMPle.CoM"
        @lead.email = mixed_case_email
        @lead.save
        assert_equal mixed_case_email.downcase, @lead.reload.email
    end
    
end
