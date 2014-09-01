#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/lib/chatwork_api.rb'

unless ARGV.size == 3
  puts "Usage: zabbix-chatwork [token:room_id] [title] [message]"
  exit
end

token, room_id = ARGV[0].split(':', 2)

if token.nil? || room_id.nil?
  puts 'Error: 1st parameter should be TOKEN:ROOMID'
  exit

end

title = ARGV[1]
message = ARGV[2]

chatwork = ChatworkApi.new(token)

chatwork.send_message(room_id, title, message)
