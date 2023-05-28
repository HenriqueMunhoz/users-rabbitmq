# frozen_string_literal: true

class BunnyClient
  class << self
    # connect
    def connect!
      @connection = Bunny.new('amqps://okezsgfv:2-UBqLVbLRRVlUrDTAANhLCf-wj4BGgB@toad.rmq.cloudamqp.com/okezsgfv')
      @connection.start
      @channel = @connection.create_channel

      @fan_out = @channel.fanout('users.out')
      @connect = true
    end

    def push(payload, type)
      connect! unless @connected

      @fan_out.publish(payload, { app_id: 'users', type: type })

      true
    end
  end
end
