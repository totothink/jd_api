require File.join(File.dirname(__FILE__), 'lib', 'jd_api')


good = JdApi::Good.new

good.get_good_info('1105760389')
