#!/bin/sh

part=$3
lib="${part}/lib"
test="${part}/test"

test_helper="${test}/test_helper.rb"
rake="${part}/Rakefile"
hound="${part}/.hound.yml"
rubocop="${part}/.rubocop.yml"

mkdir $lib
mkdir $test

echo Generating Ruby project...

echo "require 'simplecov'\nSimpleCov.start\n\nrequire 'minitest'\nrequire 'minitest/autorun'\nrequire 'minitest/pride'" > $test_helper

echo "require 'rake/testtask'\n\nRake::TestTask.new do |t|\n\tt.pattern = \"test/**/*_test.rb\"\nend\n\ntask :default => [:test]" > $rake

echo "ruby:\n  config_file: .rubocop.yml" > $hound

echo "AllCops:\n  Exclude:\n    - 'test/**/*'" > $rubocop

echo Done!