class Post

  attr_accessor :body

  def initialize(opts = {})
    @body = opts[:body].to_s
  end

end

class User

  PSW_REGEX = /\A.{8}\z/
  EMAIL_REGEX = /\A\p{Alnum}+@[a-zA-Z]+\p{Alnum}\.com\z/


  attr_accessor :email, :password, :nickname, :posts

  def initialize(opts_1 = {})
    @email = opts_1[:email].to_s.scan(EMAIL_REGEX).any? ? opts_1[:email] :  abort("Escribir un e-mail valido")#raise(Exception.new("Invalid")) la manera de levantar excepciones
    @password = opts_1[:password].to_s.scan(PSW_REGEX).any? ? opts_1[:password] : abort("No es un password valido")
    @nickname = opts_1[:nickname].to_s #to_s me deja un valor por defecto con ""
    @posts = opts_1[:posts].is_a?(Array) ? opts_1[:posts] : []
  end

  #crea un post y lo agrega al arreglo de posts
  #parameters: opts = {}. opts[:body], recibe el body del post en un hash
  def create_post(opts = {})
    self.posts << Post.new(body: opts[:body])
  end

  def authenticate(password)
    self.password == password_submitted.to_s
  end
  
end
user = User.new(
  email: "dijfjif4940@gmail.com",
  password: "1234515"
)

#me recorre todo lo que contenga el user
puts user.inspect
