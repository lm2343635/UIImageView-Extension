UIImageView+Extension ![Supported Platforms](https://img.shields.io/cocoapods/p/UIImageView+Extension.svg) [![Latest pod release](https://img.shields.io/cocoapods/v/UIImageView+Extension.svg)](https://cocoapods.org/pods/UIImageView+Extension) [![Build Status](https://travis-ci.org/alexandreos/UILabel-Copyable.svg?branch=master)]() [![License](https://img.shields.io/cocoapods/l/UIImageView+Extension.svg)](https://github.com/lm2343635/UIImageView-Extension/LICENSE)
===
A simple UIImageView category with some extension functions.

# Features
- Support Interface Builder.
- Set border radius for image view.
- Set shadow for image view.

# Installation

### CocoaPods
Installing UIImageView+Extension by [CocoaPods](http://cocoapods.org/). 

```ruby
pod 'UIImageView+Extension', '~> 0.2'
```
### Old-fashioned way

- Add `UIImageView+Extension.h` and `UIImageView+Extension.m` to your project.
- `#import "UIImageView+Extension.h"` where you want to use the control.
- These files require **ARC**.

# Usage

- If you just want to set features in Interface Builder, just do it in Interface Builder, you need not to do anything.

![Interface Builder Guide](https://raw.githubusercontent.com/lm2343635/UIImageView-Extension/master/Screenshoots/InterfaceBuilderGuide.png)

- If you want to control your image view in your program, you should import the category header: `#import "UIImageView+Extension.h"` to your `.h` or `.m` file.

```objective-c
// Set corner radius.
[_imageView setImageCornerRadius:5.0];

// Init a shadow with color, offset and raduis.
[_imageView setShadowWithColor:[UIColor darkGrayColor]
                 shadowXOffset:0
                 shadowYOffset:0
                  shadowRadius:5.0];

// Change shadow color, offset and radius.
[_imageView changeShadowColor:[UIColor redColor]];
[_imageView changeShadowRadius:1.0];
[_imageView changeShadowXOffset:1.0];
[_imageView changeShadowYOffset:1.0];
```

- The method `setShadowWithColor:shadowXOffset:shadowYOffset:shadowRadius:`should be invoked before you invoke methods including `changeShadowColor:color`, `changeShadowXOffset:xOffset`, `changeShadowYOffset:yOffset` and `changeShadowRadius:radius`.

# Demo App
A demo project contained in this repository shows how to use it from a storyboard.

![Demo App](https://raw.githubusercontent.com/lm2343635/UIImageView-Extension/master/Screenshoots/DemoApp.png)

# Change log
* version 0.2.0
  * Support Interface Builder.
  * Support changing shadow style.

* version 0.1.0
  * Set corner radius and shadow for UIImageView.

# License

UIImageView+Extension is licensed under the terms of the MIT License. Please see the [LICENSE](LICENSE) file for full details.
