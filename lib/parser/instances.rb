require 'json'

module Parser
  class Instances
    attr_reader :instances

    def initialize
      @instances = Aws::Instances.new
    end

    def parse(json, region)
      JSON.parse(json)["Reservations"].each do |reservation|
        reservation["Instances"].each do |instance|
          instance["SecurityGroups"].each do |sg|
            @instances << Aws::Instance.new(
              region: region,
              name: instance["Tags"][0]["Value"],
              instance_id: instance["InstanceId"],
              sg_name: sg["GroupName"],
              sg_id: sg["GroupId"]
            )
          end
        end
      end
    end
  end
end
