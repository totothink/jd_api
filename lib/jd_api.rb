require "jd_api/version"
require 'uri'
require 'digest/md5'
require 'json'
require 'net/http'

module JdApi
  class Client
    def initialize(app_key, app_secret)
      @url = URI.parse("http://gw.api.360buy.com/routerjson")
      @app_key = app_key
      @app_secret = app_secret
    end

    def catelogy_list(catelogy_id, level, fields = 'id,fid,status,lev,name,index_id', is_icon = false, is_desc = false)
      params = {
        'base' => fields,
        'isIcon' => is_icon,
        'isDescription' => is_desc,
        'client' => 'm',
        'catelogyId' => catelogy_id,
        'level' => level
      }
      request('jingdong.ware.product.catelogy.list.get', params)
    end

    def product_list_by_catelogy(catelogy_id, page = 1 , per_page = 100)
      params ={
        'catelogyId' => catelogy_id,
        'page' => page,
        'pageSize' => per_page,
        'client' => 'm'
      }
      request('jingdong.ware.promotion.search.catelogy.list', params)
    end

    def base_product(ids, fields = "name, image_path")
      params = {
        'base' => fields,
        'ids' => ids
      }
      request('jingdong.ware.baseproduct.get', params)
    end

    def base_book(id)
      params ={
        'sku_id' => id
      }
      request('jingdong.ware.basebook.get', params)
    end

    def book_big_field(id)
      params ={
        'sku_id' => id
      }
      request('jingdong.ware.bookbigfield.get', params)
    end

    private
    def request(method, params)
      #str sort
      params = {
        '360buy_param_json' => params.to_json,
        'access_token' => '',
        'app_key' => @app_key,
        'method' => method,
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
