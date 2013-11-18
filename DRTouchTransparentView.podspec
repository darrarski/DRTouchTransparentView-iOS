Pod::Spec.new do |s|
  s.name         = "DRTouchTransparentView"
  s.version      = "0.1"
  s.summary      = "Touch-transparent view"
  s.homepage     = "https://darrarski@bitbucket.org/darrarski/drtouchtransparentview.git"
  s.license      = 'MIT'
  s.author       = { "Darrarski" => "darrarski@gmail.com" }
  s.source       = { :git => "https://darrarski@bitbucket.org/darrarski/drtouchtransparentview.git" }
  s.source_files = 'DRTouchTransparentView/UIView+DRTouchTransparentView.{h,m}'
  s.platform     = :ios
  s.requires_arc = true
end