module Aws
  class SecurityGroup
    include Operational
    attr_reader :region, :group_id, :group_name, :description, :protocol, :port, :type, :value, :primary_id

    def initialize(region: nil, group_id: nil, group_name: nil, description: nil, protocol: nil, port: nil, type: nil, value: nil)
      @region = region
      @group_id = group_id
      @group_name = group_name
      @description = description
      @protocol = (protocol == "-1") ? nil : protocol
      @port = port
      @type = type
      @value = value
      @primary_id = @group_id
    end

    private

    def command(type)
      command = "aws ec2 #{type} --group-id #{@group_id} --protocol #{@protocol} --port #{@port} --region #{@region}"
      command << case @type
      when "CidrIp" then
        " --cidr #{@value}"
      when "GroupId" then
        " --source-group #{@value}"
      else
        return "#{@type} is not supported yet."
      end

      result = `#{command}`
      return "Error" unless result =~ /\"return\": \"true\"/
      command
    end

    def create_command
      command "authorize-security-group-ingress"
    end

    def remove_command
      command "revoke-security-group-ingress"
    end

    def to_s
      "region: #{@region}, group_id: #{@group_id}, group_name: #{@group_name}, description: #{@description}, protocol: #{@protocol}, port: #{@port}, type: #{@type}, value: #{@value}"
    end
  end
end
