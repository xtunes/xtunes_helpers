module Xtunes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      class_option :orm

      def copy_initializer
        template "xtunes.rb", "config/initializers/xtunes.rb"
      end

      def copy_locale
        copy_file "zh-CN.yml", "config/locales/xtunes.zh-CN.yml"
        copy_file "en.yml", "config/locales/xtunes.en.yml"
      end
    end
  end
end