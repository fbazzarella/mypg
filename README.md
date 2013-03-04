# Mypg

Easy backup for Rails applications with PostgreSQL database.

## Installation

Add this line into your application's Gemfile:

    gem 'mypg'

Install the gem with Bundler:

    $ bundle

## Configuration

And then add some settings:

    $ rails g mypg:install
    
This will create a configuration file in `config/mypg.yml` who looks like this:

    # target_directory: '/path/to/backup'
    # files_to_keep:    7
    
Just enter a valid directory to save your backup files.

**Note**: If not specified, the amount of files that will be saved is 7.

## How To

#### Backup

Go to your Rails root directory and run this:

    $ rake db:backup RAILS_ENV=production
    
This command will create a `.pgsql` file in the directory with your database's structure and data. Moreover, will delete the older files wich exceed the amount to be saved.

##### Pro Tip

You can create automatic daily backups just setting up a task on [Cron](http://crontab.org/):

    $ crontab -e
    
Insert this and save:

    # m h  dom mon dow   command
    0 0 * * * cd ~/my/rails/root && rake db:backup RAILS_ENV=production
    
With that, every day in the midnight (server's time) Cron will perform your backup task automatically.

#### Restore

If you wish to restore some saved backup, go to your Rails root directory and run this:

    $ rake db:restore 'relative/target/directory/to/backup/database_x.pgsql' RAILS_ENV=production
    
This command will restructure the production database and restore all the data from backup file.

**Note**: The path for the backup file must be relative to the current directory in the console.

## Thanks

[Leonardo Ávila](http://facebook.com/leuavila) for contributing in the README translation and revision.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
