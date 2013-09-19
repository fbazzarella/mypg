require 'mypg/railtie'

module Mypg
  def self.target_directory
    yaml['target_directory'] if yaml.present?
  end

  def self.files_to_keep
    if yaml.present?
      yaml['files_to_keep']
    else
      7
    end
  end

  private

  def self.yaml
    YAML.load_file(Rails.root.join('config/mypg.yml').to_s)
  rescue Errno::ENOENT
    nil
  end
end
