#
# Be sure to run `pod lib lint BHResting.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BHResting'
  s.version          = '0.1.0'
  s.summary          = 'An iOS framework to add REST functionality to Swift classes.'
  s.description      = <<-DESC
This project's intention is to allow users to extend a class which contains basic REST operations. All you have to do is configure the shared manager with a base URI any additional options and call `save`, `update`, `destroy`, `all` or `find` and it will do any server communication for you!
                       DESC

  s.homepage         = 'https://github.com/Vilyan01/BHResting'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brian Heller' => 'bheller2010@live.com' }
  s.source           = { :git => 'https://github.com/Vilyan01/BHResting.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'BHResting/Classes/**/*'

  s.dependency 'EVReflection'
  s.dependency 'AFNetworking', '~> 3.0'
end
