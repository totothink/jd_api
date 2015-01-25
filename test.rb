require File.join(File.dirname(__FILE__), 'lib', 'jd_api')

@app_key = 'DDAC5C4598E8CAE08BB6EE780A1A3BF8'
@app_secret = '141868f891d64891a9229c2e7dfda925'
client = JdApi::Client.new(@app_key, @app_secret)

p client.base_product('981821,1094930,1115374')
p client.catelogy_list(1713, 1)
p client.product_list_by_catelogy(3449)
p client.base_book('11520007')
p client.book_big_field('11520007')