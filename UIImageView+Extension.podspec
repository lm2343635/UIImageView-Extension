Pod::Spec.new do |s|
	s.name         = "UIImageView+Extension"
	s.version      = "0.1.0"
	s.summary      = "A extension category for UIImageView."

	s.description  = <<-DESC
	# Features
	- Add border for image view
	- Add shadow for image view
	DESC

	s.homepage     = "https://github.com/lm2343635/UIImageView-Extension"
	s.license      = { :type => "MIT", :file => "LICENSE.md" }
	s.author             = { "Meng Li" => "lm2343635@126.com" }
	s.social_media_url   = "http://fczm.pw"

	s.platform     = :ios
	s.source       = { :git => "https://github.com/lm2343635/UIImageView-Extension.git", :tag => "0.1.0" }

	s.source_files  = "UIImageView+Extension/**/*.{h,m}"

	s.requires_arc = true

end
