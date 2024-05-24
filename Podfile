 source 'https://github.com/CocoaPods/Specs.git'
# source 'https://cdn.cocoapods.org/'

use_frameworks!
inhibit_all_warnings!

target 'HWPanModalDemo' do
  platform :ios, '11.0'
  pod 'Masonry'
  pod 'MJRefresh'
  pod 'HWPanModal', :path => './'
end

target 'SwiftDemo' do
  platform :ios, '11.0'
  pod 'SnapKit', '~> 5.0.0'
  pod 'HWPanModal', :path => './'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "11.0"
    end
  end
end
