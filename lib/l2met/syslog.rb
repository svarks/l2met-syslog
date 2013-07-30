require "l2met/syslog/version"
require 'logger'

module L2met
  class Syslog
    attr_accessor :logger
    attr_accessor :interval

    def self.run(options = {})
      new(options).run
    end

    def initialize(options = {})
      @logger   = options[:logger] || default_logger
      @interval = options[:interval] || 60
    end

    def run
      @thread = Thread.new do
        loop do
          sleep @interval
          log_data
        end
      end
    end

    def stop
      @thread.exit if @thread
    end

    def log_data
      raise "This method must be implemented"
    end

    def log(params)
      if @logger
        message = params.map {|p| p.join('=') }.join(' ')
        @logger.info(message)
      end
    end

    private

    def default_logger
      logger = ::Logger.new(STDOUT)
      logger.formatter = proc {|severity, datetime, progname, msg| "#{msg}\n" }
      logger
    end
  end
end
