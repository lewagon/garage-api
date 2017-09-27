namespace :cars do
  task destroy_all: :environment do
    Car.destroy_all
    puts "Destroyed all the cars"
  end
end
