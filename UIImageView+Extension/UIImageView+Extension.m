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

#pragma mark - Properties
- (BOOL)shadowContainer {
    return [objc_getAssociatedObject(self, @selector(shadowContainer)) boolValue];
}

- (void)setShadowContainer:(BOOL)shadowContainer {
    if (self.shadowContainer != shadowContainer) {
        objc_setAssociatedObject(self, @selector(shadowContainer), @(shadowContainer), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

#pragma mark - Shadow
- (void)addCornerRadius:(CGFloat)raduis {
    self.layer.cornerRadius = raduis;
    self.layer.masksToBounds = YES;
}


- (void)addShadowWithColor:(UIColor *)color
              shadowOffset:(CGFloat)offset
             shadowOpacity:(float)opacity {
    if (self.shadowContainer) {
        return;
    }
    UIView * container = [[UIView alloc] initWithFrame: self.frame];
    // Background color is necessary, reason is unknown now.
    // Any color is OK, if background color is not set, there is no shadow.
    container.backgroundColor = color;
    // Setup shadow layer and corner
    container.layer.shadowColor = color.CGColor;
    container.layer.shadowOffset = CGSizeMake(0, offset);
    container.layer.shadowOpacity = opacity;
    container.layer.shadowRadius = self.layer.cornerRadius;
    container.layer.cornerRadius = self.layer.cornerRadius;
    container.clipsToBounds = NO;
    // Sombine the views
    [self.superview insertSubview:container atIndex:0];
    self.shadowContainer = YES;
}

@end
