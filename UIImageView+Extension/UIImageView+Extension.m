//
//  UIImageView+Extension.m
//  UIImageView+Extension
//
//  Created by lidaye on 12/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import "UIImageView+Extension.h"
#import <objc/runtime.h>

@implementation UIImageView (Extension)

- (void)awakeFromNib {
    [super awakeFromNib];
    // Set corner radius if it is large than 0
    if (self.cornerRadius > 0) {
        [self setImageCornerRadius:self.cornerRadius];
    }
    // Set shadow if shadow color is not nil and shadow radiud is large than 0.
    if (self.shadowColor != nil && self.shadowRadius > 0) {
        [self setShadowWithColor:self.shadowColor
                   shadowXOffset:self.shadowXOffset
                   shadowYOffset:self.shadowXOffset
                    shadowRadius:self.shadowRadius];
    }
}

#pragma mark - Corner Radius
- (void)setImageCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    // If shadow is exist, change shadow container's radius at same time.
    if (self.shadowContainer != nil) {
        self.shadowContainer.layer.cornerRadius = radius;
    }
}

#pragma mark - Shadow
- (void)setShadowWithColor:(UIColor *)color
             shadowXOffset:(CGFloat)xOffset
             shadowYOffset:(CGFloat)yOffset
              shadowRadius:(CGFloat)radius {
    if (self.shadowContainer != nil) {
        [self.shadowContainer removeFromSuperview];
    }
    self.shadowContainer = [[UIView alloc] initWithFrame: self.frame];
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
    //self.shadowContainerSombine the views
    [self.superview insertSubview:self.shadowContainer atIndex:0];

}

- (BOOL)changeShadowColor:(UIColor *)color {
    if (self.shadowContainer == nil) {
        return NO;
    }
    self.shadowColor = color;
    self.shadowContainer.layer.shadowColor = color.CGColor;
    return YES;
}

- (BOOL)changeShadowXOffset:(CGFloat)xOffset {
    if (self.shadowContainer == nil) {
        return NO;
    }
    self.shadowXOffset = xOffset;
    self.shadowContainer.layer.shadowOffset = CGSizeMake(xOffset, self.shadowYOffset);
    return YES;
}

- (BOOL)changeShadowYOffset:(CGFloat)yOffset {
    if (self.shadowContainer == nil) {
        return NO;
    }
    self.shadowYOffset = yOffset;
    self.shadowContainer.layer.shadowOffset = CGSizeMake(self.shadowXOffset, yOffset);
    return YES;
}

- (BOOL)changeShadowRadius:(CGFloat)radius {
    if (self.shadowContainer == nil) {
        return NO;
    }
    self.shadowRadius = radius;
    self.shadowContainer.layer.shadowRadius = radius;
    return YES;
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
    }
}

- (UIColor *)shadowColor {
    return objc_getAssociatedObject(self, @selector(shadowColor));
}

- (void)setShadowColor:(UIColor *)shadowColor {
    if (self.shadowColor != shadowColor) {
        objc_setAssociatedObject(self, @selector(shadowColor), shadowColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (CGFloat)shadowXOffset {
    return [objc_getAssociatedObject(self, @selector(shadowXOffset)) floatValue];
}

- (void)setShadowXOffset:(CGFloat)shadowXOffset {
    if (self.shadowXOffset != shadowXOffset) {
        objc_setAssociatedObject(self, @selector(shadowXOffset), @(shadowXOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (CGFloat)shadowYOffset {
    return [objc_getAssociatedObject(self, @selector(shadowYOffset)) floatValue];
}

- (void)setShadowYOffset:(CGFloat)shadowYOffset {
    if (self.shadowYOffset != shadowYOffset) {
        objc_setAssociatedObject(self, @selector(shadowYOffset), @(shadowYOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (CGFloat)shadowRadius {
    return [objc_getAssociatedObject(self, @selector(shadowRadius)) floatValue];
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    if (self.shadowRadius != shadowRadius) {
        objc_setAssociatedObject(self, @selector(shadowRadius), @(shadowRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
