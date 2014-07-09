require "jd_api/version"
require 'uri'
require 'digest/md5'
require 'json'
require 'net/http'

module JdApi

  class Good

    def initialize
      @url = URI.parse("http://gw.api.360buy.com/routerjson")
      @app_key = 'DDAC5C4598E8CAE08BB6EE780A1A3BF8'
      @app_secret = '141868f891d64891a9229c2e7dfda925'
    end

    #ids: good ids with ","
    def base_info(ids)
      #str sort
      params = {
        '360buy_param_json' =>{
            'base' => 'name,image_path',
            'ids' => ids
          }.to_json,
        'access_token' => '',
        'app_key' => @app_key,
        'method' => 'jingdong.ware.baseproduct.get',
        'timestamp' => Time.now.strftime("%Y-%m-%d %H:%M:%S"),
        'v' => '2.0'
      }
      params['sign'] = Digest::MD5.hexdigest(@app_secret + params.sort.flatten.join + @app_secret).upcase

      #api params
      api_params_str = ''
      params.each do |k,v|
        api_params_str += "#{k}=#{v}&"
      end  

      #api http get
      url = URI.parse(URI.encode("#{@url}?#{api_params_str}"))
      result=Net::HTTP.get(url)  
      json = JSON.parse(result)
    end

  end

end
