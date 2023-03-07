#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint location_aar.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'location_aar'
  s.version          = '0.0.1'
  s.summary          = '猎运APP司机位置信息插件'
  s.description      = <<-DESC
猎运APP司机位置信息插件
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.ios.vendored_frameworks = 'frameworks/MapManager.framework'
  s.vendored_frameworks = 'MapManager.framework'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'AMapLocation'
  s.dependency 'AMapSearch'
  s.dependency 'GMObjC'
  s.platform = :ios, '9.0'
  s.static_framework = true
  

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
