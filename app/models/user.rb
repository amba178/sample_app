class User < ActiveRecord::Base
   
	has_many :authentications
	has_secure_password
	before_create :create_remember_token
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
	                                  uniqueness: { case_sensitive: false} 
    #validates(:name, presence: true)
	validates :password, length: { minimum: 6 }

    
    def User.new_remember_token
		SecureRandom.urlsafe_base64
    end

    def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    def apply_omniauth(omniauth)
    	authentications.build(:provider => omniauth['provider'], 
			                               :uid => omniauth['uid'] )
    end

    #i am not using it yet
    def password_required?
    	!password.blank?
    end

    
    private

       def create_remember_token
       	self.remember_token = User.digest(User.new_remember_token)
    
       end

       

       


end
