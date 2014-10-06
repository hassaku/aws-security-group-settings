# Aws::Security::Group::Settings [![Build Status](https://travis-ci.org/hassaku/aws-security-group-settings.svg?branch=master)](https://travis-ci.org/hassaku/aws-security-group-settings)

Configuration tool for AWS Security Groups with YAML.

## Installation

Add this line to your application's Gemfile:

    gem 'aws-security-group-settings'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws-security-group-settings

## Preparation

```
$ pip install awscli
$ mkdir config
$ vi config/regions.yml
- "us-east-1"
- "ap-northeast-1"
```

## Usage

### Dump Current Settings

```
$ aws-security-groups -d
$ ls config
instances.yml       regions.yml         security_groups.yml
```

### Dry Run

```
$ vi config/security_groups.yml
# remove a line permitting specific IP address for TCP

$ aws-security-groups
[security groups]
- group_id: sg-xxxxx, group_name: yyyyy, description: ..., protocol: tcp, port: 443, type: CidrIp, value: xx.xx.xx.xx/32
[instances]

Run 'aws-security-groups --apply' to apply above differences.
```

It's the same goes for instances.yml.

## Apply Changes

```
$ aws-security-groups --apply
# Configuraions on AWS will be changed.
```

### NOTICE

Resources removed in yaml are not applied.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
