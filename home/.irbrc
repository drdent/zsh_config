require 'irb/completion'

begin
  require 'wirb'
  require 'bond'
  Bond.start
  Wirb.start
rescue LoadError
end

# keep history
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history_file"

# Log SQL to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

def log_activeresource
  ActiveResource::Base.logger = ActiveRecord::Base.logger
end

def sqllogoff
  ActiveRecord::Base.logger = nil
end

# show compplete IRB history
def history
  puts Readline::HISTORY.entries.split("exit").last[0..-2].join("\n")
end

