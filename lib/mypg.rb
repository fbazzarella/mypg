require 'mypg/railtie'

module Mypg
  def self.target_directory
    yaml['target_directory'] if yaml.present?
  end

  def self.files_to_keep
    (yaml['files_to_keep'] if yaml.present?) || 7
  end

  private
    def self.yaml
      begin
        YAML.load_file(Rails.root.join('config/mypg.yml').to_s)
      rescue Errno::ENOENT
        nil
      end
    end
end
