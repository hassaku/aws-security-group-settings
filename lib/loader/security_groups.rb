module Loader
  class SecurityGroups
    attr_reader :security_groups

    def initialize(yaml)
      @security_groups = Aws::SecurityGroups.new

      YAML.load(yaml).each do |group_id, attributes|
        attributes["protocol"].each do |protocol, ports|
          ports.each do |port, types|
            types.each do |type, values|
              values.each do |value|
                @security_groups << Aws::SecurityGroup.new(
                  region: attributes["region"],
                  group_id: group_id,
                  group_name: attributes["group_name"],
                  description: attributes["description"],
                  protocol: protocol,
                  port: port,
                  type: type,
                  value: value
                )
              end
            end
          end
        end
      end
    end
  end
end
