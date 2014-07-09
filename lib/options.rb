require 'optparse'

class Options
  attr_reader :dry_run, :dump

  def initialize
    opt = OptionParser.new
    @dry_run = true
    @dump = false

    opt.on('-a', '--apply') do |v|
      @dry_run = false
    end

    opt.on('-d', '--dump') do |v|
      @dump = true
    end
    opt.parse!(ARGV)
  end
end
