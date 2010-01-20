require File.dirname(__FILE__) + '/../config/boot'

require 'fileutils'
require 'optparse'

options = { :directory => '.', :environment => (ENV['RAILS_ENV'] || "development").dup }
OptionParser.new do |opt|
  opt.banner = "Usage: load_games [options]"
  opt.on("-d", "--directory DIRECTORY", 'Directory to load the game files from.') { |v| options[:directory] = v }
  opt.on("-v", "--verbose", 'Make it LOUD!') { |v| options[:verbose] = v }
  opt.on("-e", "--environment ENVIRONMENT", "Specifies the environment for the runner to operate under (test/development/production).",
          "Default: development") { |v| options[:environment] = v }

  opt.parse!(ARGV)
end

ENV['RAILS_ENV'] = options[:environment]
RAILS_ENV.replace(options[:environment]) if defined?(RAILS_ENV)
require RAILS_ROOT + '/config/environment'

begin
  scan = Scan.instance
  scan.begin(options[:directory] || ".")
end

