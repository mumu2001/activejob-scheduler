module ActiveJob
  module Scheduler
    # Extensions to +ActiveJob::Base+ which re-enqueue jobs that have
    # been configured in the schedule. Jobs configured in the schedule
    # are immediately fired when the app restarts and set to perform
    # later as soon as they complete for every subsequent run after
    # that. Jobs are only "requeued" when an +Event+ matching their
    # class name is found in the scheduler.
    module Job
      extend ActiveSupport::Concern

      included do
        around_perform do |job|
          if event = Scheduler.events.find(job.class.name)
            event.enqueue
          end
        end
      end
    end
  end
end
