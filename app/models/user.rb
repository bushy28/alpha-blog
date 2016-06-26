class User < ActiveRecord::Base
    has_many :articles
    before_save {self.email= email.downcase}
    # Validation for Username
     validates :username, presence: true, 
            uniqueness: {case_sensitive: false}, 
            length: { minimum:3, maximum: 25}
    # Validation for email address of user
    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX }
                
    # adding bcrypt secure password functionality
    has_secure_password
end

     