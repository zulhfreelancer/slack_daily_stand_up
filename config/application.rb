require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DailyStandUp
  class Application < Rails::Application
    # config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths += %W( #{config.root}/lib )
    
    # we're not using Shoryuken Worker
    # config.autoload_paths += %W(#{config.root}/app/workers)
    
    config.active_job.queue_adapter = :shoryuken
  end
end
