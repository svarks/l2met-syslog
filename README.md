# L2met::Syslog

This gem allows to write system info in log using l2met compatible format.
Runs in a thread.

## Installation

Add this line to your application's Gemfile:

    gem 'l2met-syslog'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install l2met-syslog

## Usage

    class MyLogger < L2met::Syslogger
      def log_data
        log(source: ENV['APP_NAME'], measure: 'cpu', val: 10)
        log(source: ENV['APP_NAME'], measure: 'memory', val: 100)
      end
    end

    # this will start logging data in a new thread
    MyLogger.run

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
