@users = []

def create_user
  require 'faker'
  user = "#{Faker::Simpsons.character.scan(/[a-zA-Z]+/)[0]}#{Faker::Internet.free_email(user).scan(/@[a-zA-Z]+\.com/)[0]}"
  puts user
  @users << user
end

def seed
  1000.times do |i|
    create_user
  end
  puts "#{@users}"
end

seed
