require_relative 'app'

def display_menu(app)
  app.options
  print 'Enter your choice: '
  gets.chomp.to_i
end

def handle_choice(app, choice)
  actions = {
    1 => -> { app.list_books },
    2 => -> { app.list_people },
    3 => -> { app.create_person },
    4 => -> { app.create_book },
    5 => -> { app.create_rental },
    6 => -> { app.list_rentals_for_person },
    7 => -> { puts 'Exiting the app...' },
    default: -> { puts 'Invalid choice. Please try again.' }
  }

  action = actions[choice] || actions[:default]
  action.call

  choice == 7
end

def main
  app = App.new

  loop do
    choice = display_menu(app)
    exit_app = handle_choice(app, choice)
    break if exit_app

    puts "\n"
  end
end

main
