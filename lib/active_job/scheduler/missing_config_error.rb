module ActiveJob
  module Scheduler
    # Thrown when the config file doesn't exist.
    class MissingConfigError
      def initialize
        super 'Define config/jobs.yml before using activejob-scheduler'
      end
    end
  end
end
