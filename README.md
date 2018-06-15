UIImageView+Extension ![Supported Platforms](https://img.shields.io/cocoapods/p/UIImageView+Extension.svg) [![Latest pod release](https://img.shields.io/cocoapods/v/UIImageView+Extension.svg)](https://cocoapods.org/pods/UIImageView+Extension) [![Build Status](https://travis-ci.org/lm2343635/UIImageView-Extension.svg?branch=master)](https://travis-ci.org/lm2343635/UIImageView-Extension) [![License](https://img.shields.io/cocoapods/l/UIImageView+Extension.svg)](https://github.com/lm2343635/UIImageView-Extension/LICENSE)
===
A simple UIImageView category with some extension functions.

# Features
- Support Interface Builder.
- Set border radius for image view.
- Set shadow for image view.
- Rotate image view.
- Set image view to circle.

# Installation

### CocoaPods
Installing UIImageView+Extension by [CocoaPods](http://cocoapods.org/). 

```ruby
pod 'UIImageView+Extension', '~> 0.2'
```
### Manual Way

- Add `UIImageView+Extension.h` and `UIImageView+Extension.m` to your project.
- `#import "UIImageView+Extension.h"` where you want to use the control.
- These files require **ARC**.

# Usage

- If you just want to set features in Interface Builder, just do it in Interface Builder, you need not to do anything.

![Interface Builder Guide](https://raw.githubusercontent.com/lm2343635/UIImageView-Extension/master/screenshot/InterfaceBuilderGuide.png)

- If you want to control your image view in your program, you should import the category header: `#import "UIImageView+Extension.h"` to your `.h` or `.m` file.

# API Document
### Corner Radius

Setting corner radius is supported in Interface Builder.

```objective-c
// Set corner radius.
_imageView.cornerRadius = 10;
```

The method `setImageCornerRadius:`(version 0.2.1 and before) is not recommended to use in this version now.

### Shadow

Setting shadow is supported in Interface Builder.

You can also set them in your code. Shadow color and radius are necessary to create a shadow. Shadow will be shown after you set shadow color and radius.

```objective-c
// Change shadow color, offset and radius.
_imageView.shadowColor = [UIColor redColor];
_imageView.shadowRadius = 1.0;
_imageView.shadowXOffset = 1.0;
_imageView.shadowYOffset = 1.0;
```

### Rotate
You can rotate a image view infinitely by the method `startRotate:withClockwise:`, the first parameter is rotation time per 1 round, the second parameter decides this rotation is clockwise or anticlockwise. 

```objective-c
// Init a shadow with color, offset and raduis.
[_imageView startRotate:2 withClockwise:NO];

// Change shadow color, offset and radius.
[_imageView stopRotate];
```
### Blur
Setting blur is supported in Interface Builder. You can set blur style including

- **extraLight** (UIBlurEffectStyleExtraLight)
- **light** (UIBlurEffectStyleLight)
- **dark** (UIBlurEffectStyleDark)
- **regular** (UIBlurEffectStyleRegular)
- **prominent** (UIBlurEffectStyleProminent)

and blur alpha(0 < alpha <= 1) directly in the Interface Builder. The default style is regular.

```objective-c
// Change blur style, here use the enum UIBlurEffectStyle.
[_imageView changeBlurEffectStyle:UIBlurEffectStyleExtraLight];

// Change blur alpha.
_imageView.blurAlpha = 0.5;
```

### Circle

Setting image view to circle is supported in Interface Builder.
**You must insure your image view is a square(width = height).** We recommend you add `Aspect Ratio` constraint for your image view.

```objective-c
_imageView.circle = YES;
```

- Tip: If you set corner radius and circle at same time, corner radius will be invalid.

# Demo App
A demo project contained in this repository shows how to use UIImageView+Extension from a storyboard.

![Demo App](https://raw.githubusercontent.com/lm2343635/UIImageView-Extension/master/screenshot/DemoApp.png)

Another demo app: I used this extension in my app Rate Assistant, you can download this app from App Store: https://itunes.apple.com/app/murate/id1139573801 to see this demo, it is an open source app, you can get the source code from https://github.com/MuShare/Rate-iOS

# Change log

* version 0.2.6
  * Set userInteractionEnabled in the shadow container to make image view clickale.
  * Give a tip when the image view has no parent view. 

* version 0.2.5.1
  * Fix some issues.

* version 0.2.5
  * Fix the issue that UIImageView+Extension will affect the display of split line in UISegmentedControl.

* version 0.2.4
  * Shadow container needs not init manually, so we removed setImageCornerRadius and setShadowWithColor method from interface.
  * Fix the issue that image view(circle attribute ON) is not cirle with auto layout.

* version 0.2.3
  * Blur image view. 
  * Fix the constraint bug for shadow. This version fixed the bug that position and size of a shadow will be wrong if image view has some constraint in the old version.

* version 0.2.2
  * Set image view to circle.
  * Set corner radius by setter method directly. 

* version 0.2.1
  * Rotate image view infinitely.

* version 0.2.0
  * Support Interface Builder.
  * Support changing shadow style.

* version 0.1.0
  * Set corner radius and shadow for UIImageView.

# License

UIImageView+Extension is licensed under the terms of the MIT License. Please see the [LICENSE](LICENSE) file for full details.
