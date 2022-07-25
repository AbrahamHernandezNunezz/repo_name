class DesactivateJob < ApplicationJob
  queue_as :default

  def perform(interval, name)
    Thread.new do
      sleep interval
        # response = HTTParty.get('https://yesno.wtf/api')
        # puts "Body: #{response['meta']['last_updated_at']}, Code:#{response.code}, Message: #{response.message}, Headers:#{response.headers.inspect}"

        url = "https://api.currencyapi.com/v3/latest?apikey=#{ENV['api_key']}"
        start = Time.now
        response = HTTParty.get(url, timeout: ENV['timeout'])
        response_time = Time.now - start
        if response.code == 200
          data = {response_time: start.strftime('%FT%H:%M:%S'), duration: response_time, message: ":D"}
          Request.create(data)
          timestamp = start.strftime('%FT%H:%M:%S') # De momento uso este por que currency me esta mandando la misma h0ra
          # timestamp = response['meta']['last_updated_at'].to_time.strftime('%FT%H:%M:%S')
          response['data'].each do |key, value|
            data_currency = {timestamp: timestamp , currency: value['code'], value: value['value']}
            Currency.create(data_currency)
          end
        else
          p data = {response_time: start.strftime('%FT%H:%M:%S'), duration: response_time, message: "Error en la pericios code: #{response.code}"}
          Request.create(data)
        end
        # p "El servicio de nombre #{name} tardo #{response_time} segundos"
        DesactivateJob.perform_later(interval, "Job_infynit")
    end
  end
end
