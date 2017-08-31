class Post

  attr_accessor :body

  def initialize(opts = {})
    @body = opts[:body].to_s
  end

end

class User

  attr_accessor

  def initialize(opts_1 = {})
    @email = opts_1[:email]
    @password = opts_1[:password]
    @nickname = opts_1[:nickname].to_s #to_s me deja un valor por defecto con ""
    @posts = opts_1[:posts] ? opts_1[:posts] : []
  end

end
user = User.new(
  password: 123456,
)

#me recorre todo lo que contenga el user
puts user.inspect
