//
//  UIImageView+Extension.m
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

#import "UIImageView+Extension.h"
#import <objc/runtime.h>

@implementation UIImageView (Extension)

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self changeToCircle];
}

#pragma mark - Corner Radius
- (void)setImageCornerRadius: (CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    // If shadow is exist, change shadow container's radius at same time.
    if (self.shadowContainer != nil) {
        self.shadowContainer.layer.cornerRadius = radius;
    }
}

#pragma mark - Shadow
// This method should be invoked before you invoke methods including changeShadowColor:color,
// changeShadowXOffset:xOffset, changeShadowYOffset:yOffset and changeShadowRadius:radius.
- (void)setShadowWithColor:(UIColor *)color
             shadowXOffset:(CGFloat)xOffset
             shadowYOffset:(CGFloat)yOffset
              shadowRadius:(CGFloat)radius {
    if (self.superview == nil) {
        NSLog(@"WRNING: a parent view of the image view is necessary to add a shadow view.");
        return;
    }
    if (self.shadowContainer != nil) {
        [self.shadowContainer removeFromSuperview];
    }
    self.shadowContainer = [[UIView alloc] initWithFrame: self.frame];
    self.shadowContainer.userInteractionEnabled = NO;
    // Background color is necessary, reason is unknown now.
    // Any color is OK, if background color is not set, there is no shadow.
    self.shadowContainer.backgroundColor = [UIColor whiteColor];
    // Setup shadow layer and corner
    self.shadowContainer.layer.shadowColor = color.CGColor;
    self.shadowContainer.layer.shadowOffset = CGSizeMake(xOffset, yOffset);
    self.shadowContainer.layer.shadowRadius = radius;
    self.shadowContainer.layer.shadowOpacity = 1;
    self.shadowContainer.layer.cornerRadius = self.layer.cornerRadius;
    self.shadowContainer.clipsToBounds = NO;
    // Add shadow container to super view.
    [self.superview insertSubview:self.shadowContainer atIndex:0];
    // Add layout constraint for shadow container.
    [self equalToImageViewConstraintFor:self.shadowContainer];
}

// Init shadow if shadow is not exist, shadow color is not nil and shadow radiud is large than 0.
// If shadow is exist, return YES.
// If shadow is not exist(shadow container is nil), return NO.
- (BOOL)initShadowContainerIfNotExist {
    if (self.shadowContainer == nil && self.shadowColor != nil && self.shadowRadius > 0) {
        [self setShadowWithColor:self.shadowColor
                   shadowXOffset:self.shadowXOffset
                   shadowYOffset:self.shadowXOffset
                    shadowRadius:self.shadowRadius];
        return NO;
    }
    return YES;
}

#pragma mark - Rotate
- (void)startRotate:(double)secondPerRound withClockwise:(BOOL)clockwise {
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * (clockwise? 1: -1)];
    rotationAnimation.duration = secondPerRound;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    self.rotating = YES;
}

- (void)stopRotate {
    [self.layer removeAllAnimations];
    self.rotating = NO;
}

#pragma mark - Circle
- (void)changeToCircle {
    if (self.circle) {
        CGFloat width = self.bounds.size.width;
        CGFloat height = self.bounds.size.height;
        CGFloat radius = (width > height ? height : width) / 2;
        [self setImageCornerRadius:radius];
    } else if (!self.circle && self.cornerRadius > 0) {
        [self setImageCornerRadius:self.cornerRadius];
    }
}

#pragma mark - Blur
// Set blur effect view
- (void)setBlurEffectViewWithStyle:(UIBlurEffectStyle)style alpha:(CGFloat)alpha {
    if (self.effectView != nil) {
        [self.effectView removeFromSuperview];
    }
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.effectView.frame = self.bounds;
    [self addSubview:self.effectView];
    self.effectView.alpha = alpha;
    // Add layout constraint for effect view.
    [self equalToImageViewConstraintFor:self.effectView];
}

- (void)changeBlurEffectStyle:(UIBlurEffectStyle)style {
    if (self.effectView != nil) {
        [self.effectView removeFromSuperview];
    }
    [self setBlurEffectViewWithStyle:style alpha:self.alpha];
}

- (UIBlurEffectStyle)getBlurEffectStyle {
    if ([self.blurStyle isEqualToString:@"extraLight"]) {
        return UIBlurEffectStyleExtraLight;
    } else if ([self.blurStyle isEqualToString:@"light"]) {
        return UIBlurEffectStyleLight;
    } else if ([self.blurStyle isEqualToString:@"dark"]) {
        return UIBlurEffectStyleDark;
    } else if ([self.blurStyle isEqualToString:@"regular"]) {
        if (@available(iOS 10.0, *)) {
            return UIBlurEffectStyleRegular;
        } else {
            return UIBlurEffectStyleLight;
        }
    } else if ([self.blurStyle isEqualToString:@"prominent"]) {
        if (@available(iOS 10.0, *)) {
            return UIBlurEffectStyleProminent;
        } else {
            return UIBlurEffectStyleLight;
        }
    } else {
        if (@available(iOS 10.0, *)) {
            return UIBlurEffectStyleRegular;
        } else {
            return UIBlurEffectStyleLight;
        }
    }
}

#pragma mark - Service
// Set constraint for a view, this view's position and size will be same with image view(self).
- (void)equalToImageViewConstraintFor:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraints:[NSArray arrayWithObjects:
                                    [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:view
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1
                                                                  constant:0],
                                    [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:view
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:0],
                                    [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:view
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:0],
                                    [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:view
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:0],
                                    nil]];
}

#pragma mark - Properties
- (UIView *)shadowContainer {
    return objc_getAssociatedObject(self, @selector(shadowContainer));
}

- (void)setShadowContainer:(UIView *)shadowContainer {
    if (self.shadowContainer != shadowContainer) {
        objc_setAssociatedObject(self, @selector(shadowContainer), shadowContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (CGFloat)cornerRadius {
    return [objc_getAssociatedObject(self, @selector(cornerRadius)) floatValue];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (self.cornerRadius != cornerRadius) {
        objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        // Only circle is NO can corner radius be setted.
        if (!self.circle) {
            [self setImageCornerRadius: cornerRadius];
        }
    }
}

- (UIColor *)shadowColor {
    return objc_getAssociatedObject(self, @selector(shadowColor));
}

- (void)setShadowColor:(UIColor *)shadowColor {
    if (self.shadowColor != shadowColor) {
        objc_setAssociatedObject(self, @selector(shadowColor), shadowColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if ([self initShadowContainerIfNotExist]) {
            self.shadowContainer.layer.shadowColor = shadowColor.CGColor;
        }
    }
}

- (CGFloat)shadowXOffset {
    return [objc_getAssociatedObject(self, @selector(shadowXOffset)) floatValue];
}

- (void)setShadowXOffset:(CGFloat)shadowXOffset {
    if (self.shadowXOffset != shadowXOffset) {
        objc_setAssociatedObject(self, @selector(shadowXOffset), @(shadowXOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if ([self initShadowContainerIfNotExist]) {
            self.shadowContainer.layer.shadowOffset = CGSizeMake(shadowXOffset, self.shadowYOffset);
        }
    }
}

- (CGFloat)shadowYOffset {
    return [objc_getAssociatedObject(self, @selector(shadowYOffset)) floatValue];
}

- (void)setShadowYOffset:(CGFloat)shadowYOffset {
    if (self.shadowYOffset != shadowYOffset) {
        objc_setAssociatedObject(self, @selector(shadowYOffset), @(shadowYOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if ([self initShadowContainerIfNotExist]) {
            self.shadowContainer.layer.shadowOffset = CGSizeMake(self.shadowXOffset, shadowYOffset);
        }
    }
}

- (CGFloat)shadowRadius {
    return [objc_getAssociatedObject(self, @selector(shadowRadius)) floatValue];
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    if (self.shadowRadius != shadowRadius) {
        objc_setAssociatedObject(self, @selector(shadowRadius), @(shadowRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if ([self initShadowContainerIfNotExist]) {
            self.shadowContainer.layer.shadowRadius = shadowRadius;
        }
    }
}

- (BOOL)rotating {
    return [objc_getAssociatedObject(self, @selector(rotating)) boolValue];
}

- (void)setRotating:(BOOL)rotating {
    if (self.rotating != rotating) {
        objc_setAssociatedObject(self, @selector(rotating), @(rotating), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (BOOL)circle {
    return [objc_getAssociatedObject(self, @selector(circle)) boolValue];
}

- (void)setCircle:(BOOL)circle {
    if (self.circle != circle) {
        objc_setAssociatedObject(self, @selector(circle), @(circle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self changeToCircle];
    }
}

- (NSString *)blurStyle {
    return objc_getAssociatedObject(self, @selector(blurStyle));
}

- (void)setBlurStyle:(NSString *)blurStyle {
    if (self.blurStyle != blurStyle) {
        objc_setAssociatedObject(self, @selector(blurStyle), blurStyle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if (self.alpha > 0 && self.alpha <= 1) {
            [self setBlurEffectViewWithStyle:[self getBlurEffectStyle]
                                       alpha:self.blurAlpha];
        }
    }
}

- (CGFloat)blurAlpha {
    return [objc_getAssociatedObject(self, @selector(blurAlpha)) floatValue];
}

- (void)setBlurAlpha:(CGFloat)blurAlpha {
    if (self.blurAlpha != blurAlpha) {
        if (blurAlpha < 0) {
            blurAlpha = 0;
        }
        if (blurAlpha > 1) {
            blurAlpha = 1;
        }
        objc_setAssociatedObject(self, @selector(blurAlpha), @(blurAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if (self.effectView == nil) {
            [self setBlurEffectViewWithStyle:[self getBlurEffectStyle]
                                       alpha:blurAlpha];
        } else {
            self.effectView.alpha = blurAlpha;
        }
    }
}

- (UIVisualEffectView *)effectView {
    return objc_getAssociatedObject(self, @selector(effectView));
}

- (void)setEffectView:(UIVisualEffectView *)effectView {
    if (self.effectView != effectView) {
        objc_setAssociatedObject(self, @selector(effectView), effectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end

