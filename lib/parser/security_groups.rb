require 'json'

module Parser
  class SecurityGroups
    attr_reader :security_groups

    def initialize
      @security_groups = Aws::SecurityGroups.new
    end

    def parse(json, region)
      JSON.parse(json)["SecurityGroups"].each do |sg|
        sg["IpPermissions"].each do |permission|
          permission["UserIdGroupPairs"].each do |pair|
            @security_groups << Aws::SecurityGroup.new(
              region: region,
              group_id: sg["GroupId"],
              group_name: sg["GroupName"],
              description: sg["Description"],
              protocol: permission["IpProtocol"],
              port: permission["ToPort"],
              type: "GroupId",
              value: pair["GroupId"]
            )
          end

          permission["IpRanges"].each do |ip_range|
            ip_range.each do |type, range|
              @security_groups << Aws::SecurityGroup.new(
                region: region,
                group_id: sg["GroupId"],
                group_name: sg["GroupName"],
                description: sg["Description"],
                protocol: permission["IpProtocol"],
                port: permission["ToPort"],
                type: type,
                value: range
              )
            end
          end
        end
      end
    end
  end
end
