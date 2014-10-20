require 'delegate'

module Aws
  class SecurityGroups < DelegateClass(Array)
    include Configurable

    def <<(sg)
      initialize_hash(@hash, sg.group_id)
      @hash[sg.group_id]["group_name"] = sg.group_name
      @hash[sg.group_id]["region"] = sg.region
      @hash[sg.group_id]["description"] = sg.description
      initialize_hash(@hash[sg.group_id], "protocol")
      initialize_hash(@hash[sg.group_id]["protocol"], sg.protocol)
      initialize_hash(@hash[sg.group_id]["protocol"][sg.protocol], sg.port)
      @hash[sg.group_id]["protocol"][sg.protocol][sg.port][sg.type] ||= []
      @hash[sg.group_id]["protocol"][sg.protocol][sg.port][sg.type] << sg.value
      super sg
    end
  end
end
