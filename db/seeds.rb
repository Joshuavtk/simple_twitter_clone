# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'digest'

hashed_password = Digest::MD5.hexdigest 'password'

test_user = User.create!(
  email: "test@test.nl",
  user_name: "test",
  password: hashed_password
)

test_user_2 = User.create!(
  email: "test2@test.nl",
  user_name: "test2",
  password: hashed_password
)

tag_1 = Tag.create!(
  name: "Not important" 
)

tag_2 = Tag.create!(
  name: "Important" 
)

Message.create!(
  [
    {
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      user: test_user,
      tags: [tag_1, tag_2],
    },
    {
      content: "Sed pellentesque orci at sem sodales, vitae convallis magna mollis. Pellentesque consequat scelerisque venenatis. Curabitur convallis aliquam mollis. Maecenas ultricies in est a faucibus. Aenean molestie et ex vel pulvinar. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut tempus sapien sed condimentum facilisis. Etiam mattis eu sem quis maximus. Phasellus mattis condimentum lacinia. Cras blandit tempus eros, accumsan tincidunt metus dictum et. Pellentesque laoreet ipsum ut nulla aliquam cursus. Quisque a libero massa. Proin condimentum ac orci in consequat. Cras porttitor eu massa ut malesuada.",
      user: test_user,
      tags: [tag_2],
    },
    {
      content: "Nam id finibus velit. Cras tempor volutpat laoreet. Curabitur commodo eu mauris venenatis tincidunt. Sed sit amet lacus malesuada, semper ante id, varius metus. Donec tincidunt dolor a tincidunt finibus. Phasellus nec orci ac ipsum luctus molestie. Phasellus in fringilla velit. Cras gravida metus vel mi finibus volutpat. Nulla hendrerit, mauris ac lobortis aliquet, turpis urna egestas sem, et condimentum massa libero in leo.",
      user: test_user_2,
      tags: [tag_1],
    },
    {
      content: "Praesent lectus lectus, ultricies quis cursus quis, elementum vitae nisl. Nam viverra dui et elit commodo sollicitudin. Nulla sapien ipsum, volutpat in vehicula sed, egestas at justo. Nam fermentum leo eu odio efficitur dapibus. Nam in cursus ligula. Morbi ut imperdiet tellus. Ut nec ullamcorper quam. Nam vitae ante sed neque euismod fermentum vitae eu libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae congue tortor. Duis lacinia velit at posuere efficitur. Proin tempus ligula libero, pretium euismod erat lobortis in. In tincidunt faucibus tortor, eget tristique nisl sollicitudin id. Morbi auctor leo eu lorem efficitur, sit amet mollis metus egestas. Quisque quis magna eleifend, finibus risus sit amet, tempor lorem. Sed quis aliquet purus.",
      user: test_user_2,
    },
  ]
)
