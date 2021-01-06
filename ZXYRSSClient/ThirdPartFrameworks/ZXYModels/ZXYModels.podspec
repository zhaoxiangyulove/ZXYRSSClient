Pod::Spec.new do |s|
  s.name             = 'ZXYModels'
  s.version          = '1.0.0'
  s.summary          = 'model local repo'
  s.description      = 'model local repo'
  s.homepage         = 'https://github.com/zhaoxiangyulove/ZXYRSSClient'
  s.source           = { :git => '' } 
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhaoxiangyu' => 'zhaoxiangyulove@gmail.com'}
  s.source_files = 'Source/*.swift','Source/**/*.swift'
  s.ios.deployment_target = "11.0"

  s.dependency 'HandyJSON', '5.0.2'

end

