//
//  RotateViewController.h
//  UIImageView+Extension Demo
//
//  Created by 李大爷的电脑 on 13/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *controlButton;

- (IBAction)rotate:(UIButton *)sender;

@end
