//
//  BlurViewController.h
//  UIImageView+Extension Demo
//
//  Created by 李大爷的电脑 on 18/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlurViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;

- (IBAction)changeBlurStyle:(UISegmentedControl *)sender;
- (IBAction)changeBlurAlpha:(UISlider *)sender;

@end
