# Mypg

Backup simples para aplicações Rails e bancos de dados PostgreSQL.

## Installation

Add this line into your application's Gemfile:

    gem 'shuttle'

Install the gem with Bundler:

    $ bundle

## Configuration

And then add some settings:

    $ rails g shuttle:install
    
This will create a configuration file in `config/mypg.yml` who looks like this:

    # target_directory: '/path/to/backup'
    # files_to_keep:    7
    
Apenas insira um diretório válido para salvar seus arquivos de backup.

**Note**: Caso não seja especificado a quantidade de arquivos a manter, 7 será o valor padrão.

## How To

#### Backup

Go to your Rails root directory and run this:

    $ rake db:backup RAILS_ENV=production
    
Este comando irá criar um arquivo `.pgsql` no diretório de destino contendo toda a estrutura e os dados do seu banco de dados de produção. Além disso, excluirá os arquivos mais antigos que excederem a quantidade a ser mantida.

##### Pro Tip

Você pode criar backups automáticos diariamente, apenas configurando uma tarefa no [Cron](http://crontab.org/):

    $ crontab -e
    
Insira este trecho e salve:

    # m h  dom mon dow   command
    0 0 * * * cd ~/my/rails/root && rake db:backup RAILS_ENV=production
    
Com isso, todos os dias à meia noite (hora do servidor) o Cron irá rodar sua tarefa de backup automaticamente.

#### Restore

If you wish to restore some saved backup, go to your Rails root directory and run this:

    $ rake db:restore 'relative/target/directory/to/backup/database_x.pgsql' RAILS_ENV=production
    
Este comando irá reestruturar o banco de dados de produção e restaurar todos os dados à partir do arquivo.

**Note**: O caminho para o arquivo de backup deverá ser relativo ao diretório atual no console.
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
