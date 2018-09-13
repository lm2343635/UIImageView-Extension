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

IB_DESIGNABLE @implementation CornerShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)changeCornerRadius:(UIStepper *)sender {
    _imageView.cornerRadius = sender.value;
    _cornerRadiusLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (IBAction)changeShadowRadius:(UIStepper *)sender {
    _imageView.shadowRadius = sender.value;
    _shadowRadiusLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (IBAction)changeShadowXOffset:(UIStepper *)sender {
    _imageView.shadowXOffset = sender.value;
    _shadowXOffsetLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (IBAction)changeShadowYOffset:(UIStepper *)sender {
    _imageView.shadowYOffset = sender.value;
    _shadowYOffsetLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (IBAction)changeShadowColor:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            _imageView.shadowColor = [UIColor darkGrayColor];
            break;
        case 1:
            _imageView.shadowColor = [UIColor redColor];
            break;
        case 2:
            _imageView.shadowColor = [UIColor yellowColor];
            break;
        case 3:
            _imageView.shadowColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}

- (IBAction)changeIsHidden:(UISwitch *)sender {
    [_imageView setHidden: !sender.isOn];
}

@end
