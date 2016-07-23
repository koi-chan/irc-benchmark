#!/usr/bin/ruby

require 'bundler/setup'
require 'cinch'
require 'pp'

bot_config = {
  Host: 'vps1.kazagakure.net',
  Port: 6667,
  Password: nil,
  Encoding: 'UTF-8',
  Nick: 'ib-',
  User: 'irc-bench',
  RealName: 'IRC ベンチマーク',
  Channels: ['#cre']
}
number = 10

VERSION = '0.0.1'

bots = Array.new(number) { |index| index }.map do |bot|
  bot = Cinch::Bot.new do
    configure do |c|
      c.server = bot_config[:Host]
      c.port = bot_config[:Port]
      c.password = bot_config[:Password]
      # エンコーディングの既定値は UTF-8
      c.encoding = bot_config[:Encoding] || 'UTF-8'
      c.nick = bot_config[:Nick] << bot.to_s
      c.user = bot_config[:User]
      c.realname = bot_config[:RealName]
      # JOIN するチャンネルの既定値はなし（空の配列）
      c.channels = bot_config[:Channels] || []
    end
  
    # バージョン情報を返すコマンド
    on(:message, '.version') do |m|
      m.target.send("irc-bench #{VERSION}", true)
    end
  
    # 指定した数のクライアントが一斉に反応する
    on(:message, /^.reaction (\d+)/) do |m, over|
      m.target.send("reaction", true) if bot < over
    end

    # 全てのクライアントが一斉に反応する
    on(:message, '.reaction-all') do |m|
      m.target.send("reaction-all", true)
    end

    # 全てのクライアントが指定された秒数の間に反応する
    on(:message, /^.rand (\d+)/) do |m, time|
      sleep(rand(time))
      m.target.send("random wait reaction", true)
    end
  end
end
