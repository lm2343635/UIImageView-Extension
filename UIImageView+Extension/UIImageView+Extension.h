//
//  UIImageView+Extension.h
//  UIImageView+Extension
//
//  Created by lidaye on 12/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)

@property (nonatomic) BOOL shadowContainer;

- (void)addCornerRadius:(CGFloat)raduis;

- (void)addShadowWithColor:(UIColor *)color
              shadowOffset:(CGFloat)offset
             shadowOpacity:(float)opacity;

@end
