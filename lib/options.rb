require 'optparse'

class Options
  attr_reader :dry_run, :dump

  def initialize
    opt = OptionParser.new
    @dry_run = true
    @dump = false

    opt.on('-a', '--apply', 'Apply changes') do |v|
      @dry_run = false
    end

    opt.on('-d', '--dump', 'Dump current settings to config/security_groups.yml') do |v|
      @dump = true
    end
    opt.parse!(ARGV)
  end
end
