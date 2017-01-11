//
//  UIImageView+Extension.h
//  UIImageView+Extension
//
//  Created by lidaye on 12/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

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


// Set image corner radius.
- (void)setImageCornerRadius:(CGFloat)radius;

// Init a shadow with colot, offset and raduis.
- (void)setShadowWithColor:(UIColor *)color
             shadowXOffset:(CGFloat)xOffset
             shadowYOffset:(CGFloat)yOffset
              shadowRadius:(CGFloat)radius;

// Change shadow color, offset and radius.
- (BOOL)changeShadowColor:(UIColor *)color;
- (BOOL)changeShadowXOffset:(CGFloat)xOffset;
- (BOOL)changeShadowYOffset:(CGFloat)yOffset;
- (BOOL)changeShadowRadius:(CGFloat)radius;

@end
