module Aws
  class Instance
    include Operational
    attr_reader :region, :name, :sg_name, :sg_id, :primary_id

    def initialize(region: nil, name: nil, instance_id: nil, sg_name: nil, sg_id: nil)
      @region = region
      @name = name
      @primary_id = instance_id
      @sg_name = sg_name
      @sg_id = sg_id
    end

    private

    # TODO: Implement according the following document
    # http://docs.aws.amazon.com/cli/latest/reference/ec2/modify-instance-attribute.html
    def command(type)
    end

    def create_command
      message = "AWS::Instance#create_command(not impremented): "
      message << "Add #{@sg_id}(#{@sg_name}) in the security groups of #{@primary_id}(#{@name}) on #{@region} manually."
    end

    def remove_command
      message = "AWS::Instance#remove_command(not impremented): "
      message << "Remove #{@sg_id}(#{@sg_name}) in the security groups of #{@primary_id}(#{@name}) on #{@region} manually."
    end

    def to_s
      "region: #{@region}, name: #{@name}, instance_id: #{@primary_id}, security group name: #{@sg_name}, sg_id: #{@sg_id}"
    end
  end
end
