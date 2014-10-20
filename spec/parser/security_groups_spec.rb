require 'spec_helper'

describe Parser::SecurityGroups do
  subject { parser.security_groups }

  let(:parser) { Parser::SecurityGroups.new }
  let(:json) { File.open(File.dirname(__FILE__) + "/../support/fixtures/#{json_file}", 'rb').read }

  context "when json includes five configurations of security groups" do
    let(:json_file) { "five_configs_in_two_security_groups.json" }
    before { parser.parse(json, "region") }

    it "converts json to Aws::SecurityGroup object" do
      expect(subject.first.class).to eq Aws::SecurityGroup
    end

    it "extracts five objects" do
      expect(subject.size).to eq 5
    end
  end
end
