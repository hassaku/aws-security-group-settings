require 'delegate'

module Aws
  class Instances < DelegateClass(Array)
    include Configurable

    def <<(instance)
      initialize_hash(@hash, instance.primary_id)
      @hash[instance.primary_id]["name"] = instance.name
      @hash[instance.primary_id]["region"] = instance.region
      initialize_hash(@hash[instance.primary_id], "security_groups")
      @hash[instance.primary_id]["security_groups"][instance.sg_id] = instance.sg_name
      super instance
    end
  end
end
