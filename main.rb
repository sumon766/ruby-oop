require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  menu = Menu.new(app)

  loop do
    choice = menu.display_menu
    exit_app = menu.handle_choice(choice)
    break if exit_app
  
    puts "\n"
  end
end  

main
