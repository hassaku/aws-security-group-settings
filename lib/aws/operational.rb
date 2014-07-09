module Aws
  module Operational
    def ==(another)
      self.instance_variables.all? {|v| self.instance_variable_get(v) == another.instance_variable_get(v) }
    end

    def create(dry_run)
      puts dry_run ? "+ #{to_s}" : create_command
    end

    def remove(dry_run)
      puts dry_run ? "- #{to_s}" : remove_command
    end
  end
end
