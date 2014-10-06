require 'spec_helper'
require 'yaml'

describe Loader::SecurityGroups do
  subject { loader.security_groups }

  let(:loader) { Loader::SecurityGroups.new(yml) }
  let(:yml) { File.read(File.dirname(__FILE__) + "/../support/fixtures/#{yml_file}") }

  context "when yaml includes five configurations of security groups" do
    let(:yml_file) { "five_configs_in_two_security_groups.yml" }

    it "converts yaml to Aws::SecurityGroup object" do
      expect(subject.first.class).to eq Aws::SecurityGroup
    end

    it "extracts five objects" do
      expect(subject.size).to eq 5
    end
  end
end
