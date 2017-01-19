Pod::Spec.new do |s|
	s.name         = "UIImageView+Extension"
	s.version      = "0.2.3"
	s.summary      = "A simple UIImageView category with some extension functions."

	s.description  = <<-DESC
	# Features
    - Supports Interface Builder.
    - Set border radius for image view.
    - Set shadow for image view.
    - Rotate image view.
    - Set image view to circle.
    - Blur image view.
	DESC

	s.homepage     = "https://github.com/lm2343635/UIImageView-Extension"
	s.license      = { :type => "MIT", :file => "LICENSE" }
	s.author             = { "Meng Li" => "lm2343635@126.com" }
	s.social_media_url   = "http://fczm.pw"

	s.platform     = :ios
	s.source       = { :git => "https://github.com/lm2343635/UIImageView-Extension.git", :tag => "0.2.3" }

	s.source_files  = "UIImageView+Extension/**/*.{h,m}"

	s.requires_arc = true
end
