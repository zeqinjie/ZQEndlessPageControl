#
# Be sure to run `pod lib lint ZQEndlessPageControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZQEndlessPageControl'
  s.version          = '0.1.0'
  s.summary          = '为了适配 iOS14 的 pageControl 自定义的控件'
  s.homepage         = 'https://github.com/zeqinjie/ZQEndlessPageControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhengzeqin' => 'zhengzeqin@addcn.com' }
  s.source           = { :git => 'https://github.com/zeqinjie/ZQEndlessPageControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'ZQEndlessPageControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZQEndlessPageControl' => ['ZQEndlessPageControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
