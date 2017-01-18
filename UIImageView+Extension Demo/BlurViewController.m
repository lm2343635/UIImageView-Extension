//
//  BlurViewController.m
//  UIImageView+Extension Demo
//
//  Created by 李大爷的电脑 on 18/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import "BlurViewController.h"
#import "UIImageView+Extension.h"

@interface BlurViewController ()

@end

@implementation BlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)changeBlurStyle:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [_imageView changeBlurEffectStyle:UIBlurEffectStyleExtraLight];
            break;
        case 1:
            [_imageView changeBlurEffectStyle:UIBlurEffectStyleLight];
            break;
        case 2:
            [_imageView changeBlurEffectStyle:UIBlurEffectStyleDark];
            break;
        case 3:
            [_imageView changeBlurEffectStyle:UIBlurEffectStyleRegular];
            break;
        case 4:
            [_imageView changeBlurEffectStyle:UIBlurEffectStyleProminent];
            break;
        default:
            break;
    }
}

- (IBAction)changeBlurAlpha:(UISlider *)sender {
    _imageView.blurAlpha = sender.value;
    _alphaLabel.text = [NSString stringWithFormat:@"%.2f", sender.value];
}
@end
