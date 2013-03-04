require 'colored'

namespace :db do
  desc "Dump all database's data and structure"
  task backup: :environment do
    unless File.directory? Mypg.target_directory.to_s
      puts %{
  You should define a valid target directory in 'config/mypg.yml'.
  Or run 'rails g mypg:install' to create this file with some examples.
      }.yellow

      exit
    end

    puts "Backing up your #{Rails.env} database...".green.bold

    config = ActiveRecord::Base.configurations[Rails.env]
    file   = "#{config['database']}_#{Time.now.strftime('%Y%m%d%H%M%S')}.pgsql"

    system "PGPASSWORD=#{config['password']} pg_dump --clean -h localhost -U #{config['username']} #{config['database']} > #{Mypg.target_directory}/#{file}"

    files = Dir["#{Mypg.target_directory}/*.pgsql"].sort_by{ |f| File.mtime(f) }.reverse

    FileUtils.rm files.last(files.size - Mypg.files_to_keep) if files.size > Mypg.files_to_keep

    puts "Done!".green.bold
  end

  desc "Restore last database backup"
  task restore: :environment do
    if ARGV[1].present?
      puts "Restoring database backup from '#{ARGV[1]}'...".green.bold

      config = ActiveRecord::Base.configurations[Rails.env]
      file   = Rails.root.join(ARGV[1]).to_s

      print "You're in #{Rails.env.titleize}! Are you sure? ".red.bold

      system "psql -h localhost -U #{config['username']} -d #{config['database']} -W < #{file}"

      puts "Done!".green.bold
    else
      puts "Please tell me the file that you want to restore...".yellow.bold
    end
  end
end
