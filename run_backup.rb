#!/usr/bin/env ruby

require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib', 'backup.rb')

Lockfile.new 'state.lock', :retries => 2 do
  config_file = GmailBackup::YAMLFile.new('config.yml')
  state_file = GmailBackup::YAMLFile.new('state.yml')

  GmailBackup::IMAPBackup.new(config_file, state_file).run
end
