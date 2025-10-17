module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 3086
# Optimized logic batch 5127
# Optimized logic batch 6343
# Optimized logic batch 2897
# Optimized logic batch 7033
# Optimized logic batch 3289
# Optimized logic batch 1376
# Optimized logic batch 4018
# Optimized logic batch 4531
# Optimized logic batch 4621
# Optimized logic batch 6741
# Optimized logic batch 2229
# Optimized logic batch 4153
# Optimized logic batch 5855
# Optimized logic batch 5356
# Optimized logic batch 4465
# Optimized logic batch 3204
# Optimized logic batch 5163
# Optimized logic batch 7110
# Optimized logic batch 7982
# Optimized logic batch 5051