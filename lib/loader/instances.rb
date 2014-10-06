module Loader
  class Instances
    attr_reader :instances

    def initialize(yaml)
      @instances = Aws::Instances.new

      YAML.load(yaml).each do |instance_id, attributes|
        attributes["security_groups"].each do |sg_id, sg_name|
          @instances << Aws::Instance.new(
            name: attributes["name"],
            instance_id: instance_id,
            sg_name: sg_name,
            sg_id: sg_id
          )
        end
      end
    end
  end
end
