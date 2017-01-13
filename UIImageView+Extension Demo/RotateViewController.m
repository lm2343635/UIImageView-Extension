//
//  RotateViewController.m
//  UIImageView+Extension Demo
//
//  Created by 李大爷的电脑 on 13/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import "RotateViewController.h"
#import "UIImageView+Extension.h"

@interface RotateViewController ()

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rotate:(UIButton *)sender {
    if (_imageView.rotating) {
        [_imageView stopRotate];
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    } else {
        [_imageView startRotate:2 withClockwise:NO];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
    }
}

@end
