require "jd_api/version"
require 'uri'
require 'digest/md5'
require 'json'
require 'open-uri'

module JdApi

  class Good

    def initialize

      @url = URI.parse("http://gw.api.360buy.com/routerjson")
      @accessKey = 'd56f061334cf42e8adee75c32a5a698f'
      @secretKey = '99daea4de4834cff89528c437e61afedHW6Y0ruf'

    end

    def get_good_info(id)
      params = {
        'method' => '360buy.ware.get',
        'access_token' => '',
        'app_key' => @accessKey,
        'timestamp' => Time.now.strftime("%Y-%m-%d %H:%M:%S"),
        'v' => '2.0',
        '360buy_param_json' =>  {
          'ware_id' => id
        }
      }

      params['sign'] = Digest::MD5.hexdigest(@secretKey + params.sort.flatten.join + @secretKey).upcase

      resp = Net::HTTP.post_form(@url, params)
      json = JSON.parse(resp.body)

      p json

    end

  end

end
