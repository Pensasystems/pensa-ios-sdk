Pod::Spec.new do |spec|
  spec.name         = 'PensaSdk'
  spec.version      = '1.0.6'
  spec.summary      = 'iOS SDK by Pensa Systems.'
  spec.description  = <<-DESC
    The Pensa Mobile App SDK is a developer toolkit designed to simplify adding Pensa’s capabilities to your mobile applications.
  DESC
  spec.homepage     = 'https://pensasystems.com/'
  spec.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Copyright 2025 Pensa Systems

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
  LICENSE
  }
  spec.author       = { 'Pensa Systems' => 'mobile-l@pensasystems.com' }
  spec.source       = { :git => 'https://github.com/Pensasystems/pensa-ios-sdk.git', :tag => spec.version }
  spec.ios.deployment_target = '15.0'
  spec.swift_version = '5.0'
  spec.vendored_frameworks = 'PensaSdk.xcframework'
end
