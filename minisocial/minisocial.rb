class Post

  attr_accessor :body

  def initialize(opts = {})
    @body = opts[:body].to_s
  end

  def nice_print
    puts "*"*5
    puts "\t #{self.body}"
    puts "*"*5
  end

end

class User

  PSW_REGEX = /\A.{8}\z/
  EMAIL_REGEX = /\A\p{Alnum}+@\p{Alnum}+\.com\z/
  attr_accessor :email, :password, :nickname, :posts

  def initialize(opts = {})
    #@email = opts[:email] ? opts[:email] : raise(Exception.new("PailaMiPerro"))
    @email = opts[:email].to_s
              .scan(EMAIL_REGEX).any? ?
              opts[:email] :
              abort("Email incorrecto")
    @password = opts[:password].to_s.scan(PSW_REGEX).any? ? opts[:password] : abort("Password invalido")
    @nickname = opts[:nickname].to_s
    @posts = opts[:posts].is_a?(Array) ? opts[:posts] : []
  end

  # crea un Post y lo agrega al arreglo de posts
  # parameters: opts = {}. opts[:body], recibe el body del post en un hash.
  def create_post(opts = {})
    self.posts << Post.new(opts)
  end

  def authenticate(password_submitted)
    self.password == password_submitted.to_s
  end

  def nice_print_posts
    puts"--#{self.email}--"
    self.posts.each do |post|
      post.nice_print
    end
  puts ""
  end

end

# user = User.new(
#   email: "yonga@fusepong.com",
#   password: "holaqueh",
#   nickname: "yonga"
# )
# user2 = User.new(
#   email: "camilo@fusepong.com",
#   password: "12345678",
#   nickname: "camilo"
# )
#
# user.create_post(body: "hola que hace, banderiando o que hace??")
# puts user.posts.inspect
# puts user.posts.first
# puts user.posts.first.class
# puts user.posts.first.inspect
# puts user.posts.first.body
#
# puts "authenticate #{user.nickname} with 12345678"
# puts user.authenticate "12345678"
# puts "authenticate #{user2.nickname} with 12345678"
# puts user2.authenticate "12345678"

def menu
  system("clear")
  puts '#'*60
  puts '#'*60
  puts "MINISOCIAL :)".rjust(40, '#') + '#'*20
  puts "WELCOME".rjust(35, '#') + '#'*25
  puts "_"*60
  puts ""
  puts "MENU"
  puts ""
  puts "1. Registrarse"
  puts "2. Iniciar sesion"
  puts "0. Salir"
end

def logged_in_menu
  system("clear")
  puts '#'*60
  puts '#'*60
  puts "MINISOCIAL :)".rjust(40, '#') + '#'*20
  puts "WELCOME - #{@current_user.nickname.length <= 0 ?
                    @current_user.email :
                    @current_user.nickname}"
  puts "_"*60
  puts ""
  puts "MENU"
  puts ""
  puts "1. Publicar"
  puts "2. Ver publicaciones"
  puts "3. Cerrar sesion"
  puts "0. Salir"
end

def publish #yo
  system "clear"
  puts "Escriba post"
  body = gets.chomp
  if body.length <= 0
    system "clear"
    puts "Tu publicación debe tener contenido.. Presiona cualquier tecla para continuar"
    gets.chomp
    publish
    return
  end
  @current_user.create_post(body:body) # @ variables de clase
  puts "Excelente post"
  puts "Presione, la tecla 'enter' para continuar..."
  gets.chomp
end

def newsfeed
  system "clear"
  puts "NEWSFEED"
  puts ""
  @users.each do |email, user| #key(email) and user
    user.nice_print_posts
    # puts email
    # puts user.posts.map{|post| post.body }.join("\n") #map porque post es un arreglo, lo que hace es armarme otro arreglo basado en lo que hay dentro del .map #\n salto de linea
    # puts ""
  end
  puts "Presione, la tecla 'enter' para continuar..."
  gets.chomp
end

def sign_up
  system "clear"
  puts "Digite su correo electronico."
  email = gets.chomp
  puts "Digite su password."
  password = gets.chomp
  puts "Confirme su password."
  password_confirmation = gets.chomp
  puts "Digite su nickname."
  nickname = gets.chomp
  if password != password_confirmation
    system "clear"
    puts "Password no concide con la confirmacion, intentelo nuevamente. Presione cualquier tecla para continuar..."
    gets.chomp
    sign_up
    return
  end
  if @users[email]
    system "clear"
    puts "Ya se encuentra un usuario registrado con este email. Crea una cuenta nueva. Presione cualquier tecla para continuar..."
    gets.chomp
    sign_up
    return
  end
  @users[email] = User.new(email: email, password: password, nickname: nickname)
  @current_user = @users[email]
end

def sign_in
  system "clear"
  puts "Digite su correo electronico."
  email = gets.chomp
  puts "Digite su password"
  password  = gets.chomp
  if @users[email] and @users[email].authenticate(password)
    @current_user = @users[email]
  else
    system "clear"
    puts "El email o el password son incorrectos. Intente nuevamente, presione cualquier tecla para continuar..."
    gets.chomp
    return
  end
end

def logout
  system "clear"
  puts "ADIOS!!!! Presione, cualquier tecla para continuar..."
  gets.chomp
  @current_user = nil
  return
end

@input = nil
@users = {}
@users["csanchezzorro@gmail.com"] = User.new(
    email: "csanchezzorro@gmail.com",
    password: "password",
    nickname: "zorro"
)

@current_user = nil
while @input != 0 do
  if @current_user
    logged_in_menu
    case @input
    when 1 then publish
    when 2 then newsfeed
    when 3 then logout
    end
  else
    menu
    case @input
    when 1 then sign_up
    when 2 then sign_in
    end
  end
  @current_user ? logged_in_menu : menu
  @input = gets.chomp.to_i
end
#
