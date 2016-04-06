namespace :db do
  desc "Reload database"
  task reload: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end

  namespace :seed do
    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern
      desc "Seed #{task_name}"
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end
