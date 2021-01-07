Pod::Spec.new do |s|
  s.name             = 'Template'
  s.version          = '1.0.0'
  s.summary          = 'local repo'
  s.description      = 'local repo'
  s.homepage         = 'https://github.com/zhaoxiangyulove/ZXYRSSClient'
  s.source           = { :git => '' } 
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhaoxiangyu' => 'zhaoxiangyulove@gmail.com'}
  s.source_files = 'Source/*.swift','Source/**/*.swift'
  s.ios.deployment_target = "11.0"

end

