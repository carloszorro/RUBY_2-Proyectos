class Post

  attr_accessor :body

  def initialize(opts = {})
    @body = opts[:body].to_s
    @user = opts[:user]
  end
