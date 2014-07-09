require 'delegate'

module Aws
  class Instances < DelegateClass(Array)
    include Configurable

    def <<(instance)
      initialize_hash(@hash, instance.name)
      initialize_hash(@hash[instance.name], instance.sg_id)
      @hash[instance.name][instance.sg_id] = instance.sg_name
      super instance
    end
  end
end
