class User < ActiveRecord::Base
    has_secure_password
    #SCF May not need validations: false

end
