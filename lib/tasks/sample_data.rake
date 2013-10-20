require 'faker'

namespace :db do
   desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    100.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstitorial.org"
      password = "password"
      user = User.create!(:name =>  name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
      user.toggle!(:admin) if n == 0
    end
  end


end