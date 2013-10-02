require 'mypg/railtie'

module Mypg
  class << self
    def target_directory
      if yaml
        yaml['target_directory'] 
      end
    end

    def files_to_keep
      if yaml && yaml['files_to_keep']
        yaml['files_to_keep']
      else
        7
      end
    end
  end

  private

  def self.yaml
    YAML.load_file(Rails.root.join('config/mypg.yml').to_s)
  rescue Errno::ENOENT
    nil
  end
end
