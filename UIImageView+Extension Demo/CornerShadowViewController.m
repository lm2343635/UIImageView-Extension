//
//  ViewController.m
//  UIImageView+Extension Demo
//
//  Created by lidaye on 12/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import "CornerShadowViewController.h"
#import "UIImageView+Extension.h"

@interface CornerShadowViewController ()

@end

@implementation CornerShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)changeCornerRadius:(UIStepper *)sender {
    _imageView.cornerRadius = sender.value;
    _cornerRadiusLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (IBAction)changeShadowRadius:(UIStepper *)sender {
    [_imageView changeShadowRadius:sender.value];
    _shadowRadiusLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (IBAction)changeShadowXOffset:(UIStepper *)sender {
    [_imageView changeShadowXOffset:sender.value];
    _shadowXOffsetLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (IBAction)changeShadowYOffset:(UIStepper *)sender {
    [_imageView changeShadowYOffset:sender.value];
    _shadowYOffsetLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (IBAction)changeShadowColor:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [_imageView changeShadowColor:[UIColor darkGrayColor]];
            break;
        case 1:
            [_imageView changeShadowColor:[UIColor redColor]];
            break;
        case 2:
            [_imageView changeShadowColor:[UIColor yellowColor]];
            break;
        case 3:
            [_imageView changeShadowColor:[UIColor blueColor]];
            break;
        default:
            break;
    }
}

@end
