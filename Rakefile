namespace :db do 
  task :migrate do
    require "sequel"
    Sequel.extension :migration
    DB = Sequel.postgres("farmsubsidy_development")
    Sequel::Migrator.run(DB, './db/migrations', :use_transactions=>true)
  end
end



