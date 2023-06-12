class Menu
    def initialize(app)
        @app = app
        @actions = {
            1 => :list_books,
            2 => :list_people,
            3 => :create_person,
            4 => :create_book,
            5 => :create_rental,
            6 => :list_rentals_for_person,
            7 => :exit_app,
            default: :invalid_choice
        }
    end
    
    def display_menu
        @app.options
        print 'Enter your choice: '
        gets.chomp.to_i
    end
    
    def handle_choice(choice)
        action = @actions[choice] || @actions[:default]
        send(action)

        choice == 7
    end
    
    private

    def list_books
        @app.list_books
    end
    
    def list_people
        @app.list_people
    end
    
    def create_person
        @app.create_person
    end
    
    def create_book
        @app.create_book
    end
    
    def create_rental
        @app.create_rental
    end
    
    def list_rentals_for_person
        @app.list_rentals_for_person
    end
    
    def exit_app
        puts 'Exiting the app...'
    end
    
    def invalid_choice
        puts 'Invalid choice, please try again!'
    end
end