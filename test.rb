require File.join(File.dirname(__FILE__), 'lib', 'jd_api')


good = JdApi::Good.new

p good.base_info('981821,1094930,1115374')
