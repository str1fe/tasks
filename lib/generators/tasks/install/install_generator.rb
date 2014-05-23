class Tasks::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc 'Install the default configurations for Tasks'

  def copy_initializer
    template 'tasks.rb', 'config/initializers/tasks.rb'
  end

  def add_route
    route "mount Tasks::Engine, at: '/tasks'"
  end

  def add_helpers
    inject_into_file 'app/controllers/application_controller.rb',
                     "\n  helper Tasks::Engine.helpers",
                     after: 'protect_from_forgery with: :exception'
  end

  def copy_migrations
    rake 'tasks:install:migrations'
  end
end