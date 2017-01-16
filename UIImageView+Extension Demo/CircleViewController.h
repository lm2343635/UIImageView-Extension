//
//  CircleViewController.h
//  UIImageView+Extension Demo
//
//  Created by 李大爷的电脑 on 16/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)changeCircleState:(UISwitch *)sender;

@end
