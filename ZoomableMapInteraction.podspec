#
# Be sure to run `pod lib lint ZoomableMapInteraction.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZoomableMapInteraction'
  s.version          = '1.0.0'
  s.summary          = 'Adds a tap and pan interaction to an MKMapView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ZoomableMapInteraction is an UIInteraction which adds the tap-and-pan behavior seen in Apple Maps to any MKMapView.
It's only one short file, you can add it either using Cocoapods or by copying to your project.
                       DESC

  s.swift_version    = '4.2'
  s.homepage         = 'https://github.com/iCarambaa/ZoomableMapInteraction'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sven Titgemeyer' => 's.titgemeyer@titgemeyer-it.de' }
  s.source           = { :git => 'https://github.com/icarambaa/ZoomableMapInteraction.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/s_titgemeyer'

  s.ios.deployment_target = '11.0'

  s.source_files = 'ZoomableMapInteraction.swift'
  s.frameworks = 'UIKit', 'MapKit'
end
