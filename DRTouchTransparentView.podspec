Pod::Spec.new do |s|
  s.name         = "DRTouchTransparentView"
  s.version      = "0.1"
  s.summary      = "UIView cateogry for implementing touch-transparent views that acts like views with user interactions disabled, but forwards touch events to subviews."
  s.homepage     = "https://bitbucket.org/darrarski/DRTouchTransparentView.git"
  s.license      = 'MIT'
  s.author       = { "Darrarski" => "darrarski@gmail.com" }
  s.source       = { :git => "https://bitbucket.org/darrarski/DRTouchTransparentView.git" }
  s.source_files = 'DRTouchTransparentView/UIView+DRTouchTransparentView.{h,m}'
  s.platform     = :ios
  s.requires_arc = true
end