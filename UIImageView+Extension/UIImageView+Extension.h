//
//  UIImageView+Extension.h
//  UIImageView+Extension
//
//  Created by lidaye on 12/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)

// Corder raduis of this image view.
@property (nonatomic) IBInspectable CGFloat cornerRadius;

// Shadow property
@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic) IBInspectable CGFloat shadowXOffset;
@property (nonatomic) IBInspectable CGFloat shadowYOffset;
@property (nonatomic) IBInspectable CGFloat shadowRadius;

// UIView, a shadow container
@property (strong, nonatomic) UIView *shadowContainer;

// Rotate state
@property (nonatomic) BOOL rotating;

// Circle state
@property (nonatomic) IBInspectable BOOL circle;

// Blur
@property (nonatomic) IBInspectable NSString *blurStyle;
@property (nonatomic) IBInspectable CGFloat blurAlpha;
// Effect view for blur
@property (nonatomic, strong) UIVisualEffectView *effectView;

// Set image corner radius.
- (void)setImageCornerRadius:(CGFloat)radius;

// Init a shadow with color, offset and raduis.
- (void)setShadowWithColor:(UIColor *)color
             shadowXOffset:(CGFloat)xOffset
             shadowYOffset:(CGFloat)yOffset
              shadowRadius:(CGFloat)radius;

// Start rotate infinitely
- (void)startRotate:(double)secondPerRound withClockwise:(BOOL)clockwise;

// Stop rotate.
- (void)stopRotate;

// Set blur effect view
- (void)setBlurEffectViewWithStyle:(UIBlurEffectStyle)style alpha:(CGFloat)alpha;

// Change blur effect style.
- (void)changeBlurEffectStyle:(UIBlurEffectStyle)style;

@end
