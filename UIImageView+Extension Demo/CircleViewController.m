//
//  CircleViewController.m
//  UIImageView+Extension Demo
//
//  Created by 李大爷的电脑 on 16/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import "CircleViewController.h"
#import "UIImageView+Extension.h"

@interface CircleViewController ()

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)changeCircleState:(UISwitch *)sender {
    _imageView.circle = sender.on;
}

@end
