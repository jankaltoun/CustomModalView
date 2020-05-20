#
# Be sure to run `pod lib lint AlamofireEasyLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomModalView'
  s.version          = '1.0.0'
  s.summary          = 'Fully customizable Modal View component built in SwiftUI for SwiftUI on iOS and macOS'
  s.swift_version    = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Custom Modal View is a fully customizable modal view component built in SwiftUI for SwiftUI.
It's API is built similar to the native `.sheet`, so that it fits into existing SwiftUI apps.
The library is compatible with both iOS and macOS.
                       DESC

  s.homepage         = 'https://github.com/jankaltoun/CustomModalView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jankaltoun' => 'jan.kaltoun@me.com' }
  s.source           = { :git => 'https://github.com/jankaltoun/CustomModalView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'

  s.source_files = 'Sources/**/*'
end
