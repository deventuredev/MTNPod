#
# Be sure to run `pod lib lint MTNPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MTNPod'
  s.version          = '1.0.0'
  s.summary          = 'The pod of MTN 1.0.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This is the official MTN pod. This version is for testing.
                       DESC

  s.homepage         = 'https://github.com/deventuredev/MTNPod'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'deventuredev@gmail.com' => 'mihai.ionascut@deventure.co' }
  s.source           = { :git => 'https://github.com/deventuredev/MTNPod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'MTNPod/Classes/**'
  s.resource_bundles = {
      'MTNBundle' => ['MTNPod/Classes/*.{png,storyboard,xib}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.static_framework = true
  s.dependency 'GoogleMaps', '~> 4.2.0'
  s.dependency 'Google-Maps-iOS-Utils', '~> 3.8.0'
  s.dependency 'SwiftSignalRClient', '~> 0.8.0'
  s.dependency 'SwiftProtobuf', '~> 1.0'

  s.vendored_frameworks = 'Loooot.xcframework'
end
