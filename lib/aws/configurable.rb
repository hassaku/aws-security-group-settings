module Aws
  module Configurable
    def initialize
      @hash = {}
      super []
    end

    def export_yaml(filename)
      File.write(filename, @hash.to_yaml)
    end

    def converge(settings, dry_run)
      settings.each do |resource|
        next if exclude?(resource)
        resource.create(dry_run) unless has?(resource)
      end

      self.each do |resource|
        next if settings.exclude?(resource)
        resource.remove(dry_run) unless settings.has?(resource)
      end
    end

    def has?(resource)
      self.find { |r| r == resource }
    end

    def exclude?(resource)
      !self.find { |r| r.primary_id == resource.primary_id }
    end

    private

    def initialize_hash(base_hash, key)
      base_hash[key] = {} unless base_hash.has_key?(key)
    end
  end
end
