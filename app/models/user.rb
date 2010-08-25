class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :openid_authenticatable, :registerable, :recoverable, :trackable, :validatable
#  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # devise   :openid_authenticatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :identity_url

  # Handle creation of user authenticated via OpenID
  def self.create_from_identity_url(identity_url)
    User.find_or_initialize_by_identity_url(identity_url)
  end
  
  # Set email as a required field from the Open ID provider
  def self.openid_required_fields
    ["email", "http://axschema.org/contact/email"]
  end
  
  # Accept fields from Open ID provider
  def openid_fields=(fields)
    fields.each do |key, value|
      case key.to_s
      when "email", "http://axschema.org/contact/email"
        case value
        when Array
          self.email = value.first
        else
          self.email = value
        end
        if alt = self.class.find_by_email(email) and alt.id != id
          self.id = alt.id
          self.reload
          @new_record = false
        end
      end
    end

    # Create this user
    self.save!
    
  end 
end
