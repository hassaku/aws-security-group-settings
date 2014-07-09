module Aws
  class Instance
    include Operational
    attr_reader :name, :sg_name, :sg_id, :primary_id

    def initialize(name: nil, sg_name: nil, sg_id: nil)
      @name = name
      @sg_name = sg_name
      @sg_id = sg_id
      @primary_id = @name
    end

    private

    def command(type)
    end

    def create_command
      ""
    end

    def remove_command
      ""
    end

    def to_s
      "name: #{@name}, security group name: #{@sg_name}, id: #{@sg_id}"
    end
  end
end
