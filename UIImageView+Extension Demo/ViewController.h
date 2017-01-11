//
//  ViewController.h
//  UIImageView+Extension Demo
//
//  Created by lidaye on 12/01/2017.
//  Copyright © 2017 fczm.pw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *cornerRadiusLabel;
@property (weak, nonatomic) IBOutlet UILabel *shadowRadiusLabel;
@property (weak, nonatomic) IBOutlet UILabel *shadowXOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *shadowYOffsetLabel;

- (IBAction)changeCornerRadius:(UIStepper *)sender;
- (IBAction)changeShadowRadius:(UIStepper *)sender;
- (IBAction)changeShadowXOffset:(UIStepper *)sender;
- (IBAction)changeShadowYOffset:(UIStepper *)sender;
- (IBAction)changeShadowColor:(UISegmentedControl *)sender;

@end

