class User < Authentication::Models::ActiveRecord
  attr_accessible :email, :username
end
