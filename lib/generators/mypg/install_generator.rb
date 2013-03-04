module Mypg
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_install_file
        template 'mypg.yml', 'config/mypg.yml'
      end
    end
  end
end
