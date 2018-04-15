#
# Be sure to run 'pod spec lint AGi18n.podspec' to ensure this is a
# valid spec.
#
Pod::Spec.new do |s|
  s.name                  = "AGi18n"
  s.version               = "0.0.5"
  s.summary               = "Localize iOS apps by automatically extracting texts from code and XIB files and inject them back on runtime."
  s.description           = "Utility to easily localize your iOS apps by automatically extracting texts from code and XIB files into a Localizable strings and inject them back on runtime without changing your XIB files."
  s.homepage              = "https://github.com/angelolloqui/AGi18n"
  s.license               = "MIT License"
  s.author                = { "Angel Garcia Olloqui" => "http://angelolloqui.com" }
  s.source                = { :git => "https://github.com/angelolloqui/AGi18n.git", :tag => "0.0.5" }
  s.platform              = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.source_files          = 'lib/*.{h,m}'
  s.requires_arc          = true
end
